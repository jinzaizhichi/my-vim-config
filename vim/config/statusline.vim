let s:git_stats_throttle=0

hi FilenameSection cterm=NONE ctermbg=5 ctermfg=0
hi FilenameSectionEdgeIcon cterm=NONE ctermbg=0 ctermfg=5
hi GitSectionEdgeIcon cterm=NONE ctermbg=0 ctermfg=5
hi FillSection cterm=NONE ctermbg=0 ctermfg=0
hi InfoSectionLeftEdgeIcon cterm=NONE ctermbg=0 ctermfg=8
hi InfoSection cterm=NONE ctermbg=8 ctermfg=5
hi InfoSectionRightEdgeIcon cterm=NONE ctermbg=0 ctermfg=8
hi GitSectionLeftEdgeIcon cterm=NONE ctermbg=0 ctermfg=5
hi GitSection cterm=NONE ctermbg=5 ctermfg=0
hi ErrorSection cterm=NONE ctermbg=1 ctermfg=0
hi WarningSection cterm=NONE ctermbg=3 ctermfg=0

function! GitStats()
  if localtime() - s:git_stats_throttle < 2
    return get(g:, 'git_stats', '')
  endif

  let s:git_stats_throttle = localtime()
  let l:branch = exists('*FugitiveHead') ? FugitiveHead() : ''
  let l:status = system('git status --porcelain 2>/dev/null')

  if v:shell_error
    return ''
  endif

  let l:files = len(filter(split(l:status, '\n'), 'v:val !~ "^!"'))
  let l:additions = 0
  let l:deletions = 0
  let l:diff = system('git diff HEAD --numstat 2>/dev/null')

  for line in split(l:diff, '\n')
    let stats = split(line)

    if len(stats) >= 2
      let l:additions += str2nr(stats[0])
      let l:deletions += str2nr(stats[1])
    endif
  endfor

  let l:staged_diff = system('git diff --cached --numstat 2>/dev/null')

  for line in split(l:staged_diff, '\n')
    let stats = split(line)

    if len(stats) >= 2
      let l:additions += str2nr(stats[0])
      let l:deletions += str2nr(stats[1])
    endif
  endfor

  for status_line in split(l:status, '\n')
    if status_line =~ '^??'
      let file = substitute(status_line, '^??\s\+', '', '')
      let file_content = system('wc -l ' . shellescape(file) . ' 2>/dev/null')

      if !v:shell_error
        let l:additions += str2nr(split(file_content)[0])
      endif
    endif
  endfor

  return printf('+%d -%d 󱁻 %d', l:additions, l:deletions, l:files)
endfunction

function! GitStatus()
  let head = FugitiveHead()

  if empty(head)
    return '󰊢  Git Gud'
  endif

  let stats = get(g:, 'git_stats')

  return '󰊢 ' . head . ' ' . stats
endfunction


function! ActiveStatus()
  let info = get(b:, 'coc_diagnostic_info', {})

  let errors = get(info, 'error', 0)
  let warnings = get(info, 'warning', 0)

  let statusline=''
  let statusline.='%#FilenameSection#'
  let statusline.=' %f %M'
  let statusline.='%#FilenameSectionEdgeIcon#'
  let statusline.=''
  let statusline.='%#FillSection#'
  let statusline.='%='
  let statusline.='%#InfoSectionLeftEdgeIcon#'
  let statusline.=''
  let statusline.='%#InfoSection#'
  let statusline.=' %l/%L %c '
  let statusline.='%#InfoSectionRightEdgeIcon#'
  let statusline.=''
  let statusline.='%#GitSectionLeftEdgeIcon#'
  let statusline.=''
  let statusline.='%#GitSection#'
  let statusline.=' %{GitStatus()} '

  if errors > 0
    let statusline.='%#ErrorSection#'
    let statusline.=' 󰅚 ' . errors . ' '
  endif

  if warnings > 0
    let statusline.='%#WarningSection#'
    let statusline.=' 󰀦 ' . warnings . ' '
  endif

  return statusline
endfunction

function! InactiveStatus()
  return '%#FillSection#'
endfunction

augroup StatusLineUpdate
  autocmd!

  autocmd BufWritePost * let g:git_stats = GitStats()
  autocmd VimEnter * let g:git_stats = GitStats()
  autocmd BufEnter * let g:git_stats = GitStats()
  autocmd BufLeave * let g:git_stats = GitStats()

  autocmd WinEnter,ModeChanged * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()

  autocmd User CocDiagnosticChange redrawstatus
  autocmd User CocStatusChange redrawstatus
augroup END

set laststatus=2
set statusline=%!ActiveStatus()

set showtabline=0
