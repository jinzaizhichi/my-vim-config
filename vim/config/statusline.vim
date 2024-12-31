let s:git_stats_throttle=0
let g:git_icon='󰊢'
let g:arrow_left=''
let g:arrow_right=''

hi StatusLine     cterm=NONE ctermfg=5 ctermbg=0 " active status bar
hi StatusLineNC   cterm=NONE ctermfg=0 ctermbg=0 " inactive status bar
hi BufferLine     cterm=NONE ctermfg=5 ctermbg=8 " inactive buffers
hi BufferLineSel  cterm=NONE ctermfg=0 ctermbg=5 " active buffer
hi BufferLineFill cterm=NONE ctermfg=5 ctermbg=0 " fill color

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

    return printf('+%d -%d 󱁻 %d', l:additions, l:deletions, l:files)
endfunction

function! GitStatus()
    let head = FugitiveHead()

    if empty(head)
        return g:git_icon . '  Git Gud'
    endif

    let stats = get(g:, 'git_stats')

    return g:git_icon . ' ' . head . ' ' . stats
endfunction

augroup GitStatsUpdate
    autocmd!
    autocmd BufWritePost * let g:git_stats = GitStats()
    autocmd VimEnter * let g:git_stats = GitStats()
    autocmd BufEnter * let g:git_stats = GitStats()
    autocmd BufLeave * let g:git_stats = GitStats()
augroup END

set laststatus=2
set statusline=
set statusline+=%F\ %M
set statusline+=%=
set statusline+=%{GitStatus()}
set showtabline=0
