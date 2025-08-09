func! CocHoverYank() abort
    let hover_result = CocActionAsync('doHover')

    sleep 100m

    let float_wins = coc#float#get_float_win_list()
    if empty(float_wins)
        echo "S-senpai, there's no hover information here..."
        return
    endif

    let float_bufnr = winbufnr(float_wins[0])
    let hover_lines = getbufline(float_bufnr, 1, '$')
    let hover_content = join(hover_lines, "\n")

    let @" = hover_content

    if has('clipboard')
        let @+ = hover_content
    endif

    call coc#float#close_all()

    echo "Senpai! I copied the hover content for you! ♡"
endfunc

let s:git_stats_throttle=0

func! GitStats()
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
endfunc

augroup GitStatsUpdate
  autocmd!
  autocmd BufWritePost * let g:git_stats = GitStats()
  autocmd VimEnter * let g:git_stats = GitStats()
  autocmd BufEnter * let g:git_stats = GitStats()
  autocmd BufLeave * let g:git_stats = GitStats()
augroup END

func! GenerateLoremIpsum(count)
  let lorem_words = ['lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing', 'elit', 'sed', 'do', 'eiusmod', 'tempor', 'incididunt', 'ut', 'labore', 'et', 'dolore', 'magna', 'aliqua', 'enim', 'ad', 'minim', 'veniam', 'quis', 'nostrud', 'exercitation', 'ullamco', 'laboris', 'nisi', 'aliquip', 'ex', 'ea', 'commodo', 'consequat', 'duis', 'aute', 'irure', 'in', 'reprehenderit', 'voluptate', 'velit', 'esse', 'cillum', 'fugiat', 'nulla', 'pariatur', 'excepteur', 'sint', 'occaecat', 'cupidatat', 'non', 'proident', 'sunt', 'culpa', 'qui', 'officia', 'deserunt', 'mollit', 'anim', 'id', 'est', 'laborum']

  let result = []
  let word_count = a:count

  if word_count >= 2
    call add(result, 'Lorem')
    call add(result, 'ipsum')
    let word_count -= 2
  elseif word_count == 1
    call add(result, 'Lorem')
    let word_count -= 1
  endif

  while word_count > 0
    let random_index = rand() % len(lorem_words)
    call add(result, lorem_words[random_index])
    let word_count -= 1
  endwhile

  let text = join(result, ' ') . '.'
  execute "normal! a" . text
endfunc

command! -nargs=1 Lorem call GenerateLoremIpsum(<args>)
