let g:airline_skip_empty_sections=1
let g:airline_powerline_fonts=1
let g:airline_highlighting_cache=1
let g:airline_theme='keta'

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

let g:webdevicons_enable_airline_statusline=0
let g:webdevicons_enable_airline_statusline_fileformat=0

let g:airline_left_sep=''
let g:airline_right_sep=''

let s:git_stats_throttle=0

function! GitStats()
  if localtime() - s:git_stats_throttle < 2  " Only update every 2 seconds
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

  return printf('  +%d -%d 󱁻 %d', l:additions, l:deletions, l:files)
endfunction

augroup GitStatsUpdate
  autocmd!
  autocmd BufWritePost * let g:git_stats = GitStats()
  autocmd VimEnter * let g:git_stats = GitStats()
  autocmd BufEnter * let g:git_stats = GitStats()
  autocmd BufLeave * let g:git_stats = GitStats()
augroup END

let g:airline_section_a = airline#section#create_left(['mode'])
let g:airline_section_b = airline#section#create(['%t %m'])
let g:airline_section_c = airline#section#create([' '])
let g:airline_section_x = airline#section#create(['filetype', ' ', '%{WebDevIconsGetFileTypeSymbol()}', ' '])
let g:airline_section_y = airline#section#create([' %{empty(FugitiveHead()) ? "Git Gud" : FugitiveHead()}%{get(g:, "git_stats", "")}'])
