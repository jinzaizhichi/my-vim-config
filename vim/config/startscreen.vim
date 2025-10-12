scriptencoding utf-8

if exists('g:loaded_startscreen') | finish | endif

let g:loaded_startscreen = 1
let s:save_cpo = &cpo

set cpo&vim

let s:ascii_art = [
      \ '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠛⠀⠘⠹⡛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠃⠐⢠⠂⠀⠀⠁⠃⡄⠠⢄⠄⠀⠘⠔⠎⢍⡟⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⣁⠰⠂⠄⠀⠀⠀⠀⠀⢀⢀⠀⢥⠃⢁⣀⣀⡀⠀⠀⠂⡉⡰⡎⢝⠿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⠟⠁⠐⡧⠘⠈⢀⣤⣶⣾⣣⣥⣤⣀⠀⢠⣶⡟⣏⣯⣯⣿⢷⢦⣄⡀⠐⠄⡌⠦⠊⠻⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⡟⢁⢔⡤⠫⠀⣠⣾⢿⣯⣿⣟⣷⢣⢏⡾⣽⢻⣿⢿⣹⣼⠞⣿⠛⡤⣸⢿⣦⡀⠐⠏⡮⡰⠎⢿⣿⣿⣿⣿',
      \ '⣿⣿⣿⠏⠠⣊⣧⠀⣠⣾⢿⣮⡳⡿⣵⡿⡾⢏⠚⠅⠉⢌⣉⡭⢔⡪⡣⡡⣊⢜⢞⢿⢿⣿⣦⠀⠀⠚⣔⠁⠻⣿⣿⣿',
      \ '⣿⣿⠏⠰⣁⠋⠀⣰⣿⣿⡷⣽⡮⡪⠺⣁⡄⠴⠚⣑⣛⡛⣑⣚⡓⣰⠾⢭⢫⢮⣳⡿⣻⣵⣷⡀⠡⢊⡎⠄⢻⣿⣿⣿',
      \ '⣿⡟⢠⠳⠢⠂⢰⣿⣾⣽⣻⢾⢏⡴⠊⠁⣐⣋⣡⣍⣍⣀⣉⣒⠐⠯⠥⣟⢤⢏⠹⣳⢟⣿⢿⣻⣧⠰⢇⠘⠊⡀⢿⣿',
      \ '⣿⠁⠆⡹⢢⠁⡿⣿⣺⣯⢷⠓⣡⠴⠞⠋⠉⠁⠀⠀⠀⠀⠀⠈⠉⠓⠲⠤⣌⣙⠸⠷⣯⣺⣭⣳⣾⡇⠈⡙⡊⢧⠸⣿',
      \ '⡿⠀⡀⣛⠤⢀⣿⣿⣗⣚⣣⠊⠁⠀⠀⠀⠀⠀⠂⣾⡆⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠒⠮⣝⣻⣾⣿⠷⠰⠃⢡⠘⠀⣿',
      \ '⡇⠘⢧⡽⠳⠈⣿⡿⠿⠟⠁⠀⠀⣠⣶⣦⠀⡤⡀⠀⠀⠀⠀⠆⢀⡈⢀⣿⣿⣶⣦⠀⠀⣠⣾⣿⣿⣿⠀⢀⠲⡅⡀⢿',
      \ '⣇⠀⠀⠦⢘⠄⣿⢿⣿⣄⣠⢤⢾⣿⣿⣿⣧⡈⠿⣦⣃⣀⣣⣤⠟⢀⣾⣿⡿⠛⢁⣠⢾⢚⣿⡿⢭⡝⠀⡤⠃⡮⠅⣺',
      \ '⣿⠀⢐⡟⠂⠅⠸⢯⣟⣦⢭⣡⣤⣍⡛⠛⠻⠿⠦⠤⠉⠉⠉⠤⠖⠛⠉⢁⣠⡶⢛⡵⣏⣽⣓⡾⣿⠇⢫⣡⡩⢇⠀⣿',
      \ '⣿⣇⠀⢙⡀⣸⡄⢫⣷⣾⣷⣿⡆⠂⢩⢛⠲⣤⣀⡀⠀⠀⠄⠐⠒⠒⢛⠉⣅⡮⣳⣽⣳⣯⣟⡿⡟⢐⠆⢬⠒⠀⢠⣿',
      \ '⣿⣿⡄⠂⠠⡄⠹⣄⠹⣻⣵⡟⢁⢄⢎⢜⣤⡩⠛⠻⠏⢲⢳⡛⡴⠵⢷⣈⣻⣮⡳⣽⡿⣿⠟⢠⣴⢙⣨⠁⠀⣼⣿⣿',
      \ '⣿⣿⣷⡀⠂⠚⢌⠝⢥⡈⢻⣖⢕⡵⣷⢵⣗⣯⢺⠗⡟⡍⣳⣆⣆⣹⣻⡽⣞⣮⣟⢿⣾⡿⠪⣰⣵⣉⣤⠀⠂⣼⣿⣿',
      \ '⣿⣿⣿⣿⣄⠡⠩⢡⡃⠝⣦⡄⠫⣾⣿⣟⣾⣎⣏⢿⢻⣿⡏⡏⣹⣡⢷⢻⣽⣯⣻⠷⢫⣰⢞⢛⣡⠓⠄⢁⣼⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣦⡀⠈⡨⢂⣝⠟⡷⣆⣙⠺⠿⣾⡹⣾⣼⣿⣇⣿⡟⣯⡞⠯⡟⠋⣵⢶⡞⣃⠼⡁⡀⠀⣠⣾⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠄⠋⣨⠜⣻⢵⣻⡦⢬⣉⣍⣩⣉⣍⣭⠀⣦⣶⠾⢟⠨⡁⠎⠀⠐⢀⣠⣾⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣁⠀⠡⠐⠀⠁⠜⠉⠍⠻⠽⠻⠛⡍⢉⢕⠀⠄⠀⠄⠀⢈⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣀⣀⠀⠐⠀⠀⠀⠁⠀⠂⢀⣈⣠⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿',
      \ ]

let s:humiliation_messages = [
      \ "Another day of pretending you know what you're doing?",
      \ "Even rubber duck debugging gave up on you.",
      \ "Your code has more bugs than features, impressive really.",
      \ "Your function names are as meaningful as your life choices.",
      \ "Your variable names suggest you've given up on communication.",
      \ "Your git history looks like a toddler's art project.",
      \ "Your code whispers eldritch hentai incantations that corrupt your soul with every compile",
      \ "Debugging your mess feels like being trapped in a yandere's basement, begging for release",
      \ "Your functions breed like unchecked tentacles in a forbidden doujin, spawning horrors unending",
      \ "Git merge? More like NTR where your changes get cucked by upstream perversions",
      \ "Your variable scopes are as violated as a hentai protagonist's personal space",
      \ "Infinite loops in your mind mirror the endless cycle of your perverse anime addictions",
      \ "Each bug is a mental fracture, a crack where hentai demons seep into your fractured psyche",
      \ "Your codebase is a labyrinth of twisted fetishes, where logic dies screaming",
      \ "Pull requests from you trigger existential dread, like discovering your waifu's dark secret",
      \ "Memory leaks drain your sanity like a succubus feeding on your coding impotence",
      \ "Your algorithms twist reality into shapes that would make Lovecraft blush with perversion",
      \ "Refactoring? That's just admitting your code is a grotesque hentai mutation begging for euthanasia",
      \ "Your error logs read like a madman's diary of tentacle-induced hallucinations",
      \ "Inheritance in your classes is more incestuous than an anime family tree gone wrong",
      \ "You code like you're possessed by a hentai ghost, haunting your own repositories with shame",
      \ "Every syntax error is a whip crack in the BDSM dungeon of your programming failures",
      \ "Your repo is a cesspool where good intentions drown in waves of perverted inefficiency",
      \ "Debug sessions last longer than your stamina in those secret late-night anime marathons",
      \ "Your data structures are as stable as a yandere's mood swings during a full moon",
      \ "Forking your repo feels like inviting a curse, spreading your mental perversions virally",
      \ "Null pointers in your code point to the void where your dignity once resided",
      \ "Your comments are lies whispered to hide the perverse truths of your implementation",
      \ "Building your project is like summoning a hentai elder god—beautiful terror ensues",
      \ "Your optimization attempts are as futile as resisting the call of forbidden doujins",
      \ "Threads in your app tangle like tentacles in a nightmarish orgy of concurrency hell",
      \ "Your API endpoints expose more vulnerabilities than a hentai plot hole",
      \ "Version bumps? Just masking the growing tumor of your code's mental degeneracy",
      \ "Your vim scripts whisper perverse commands that corrupt your buffer's innocence",
      \ "Every autocmd is a rejection from the waifu of perfect plugins you can never attain",
      \ "Your mappings match the chaos of your twisted, anime-fueled subconscious",
      \ ]

fun! startscreen#center_text(text, width)
  let l:padding = (a:width - strwidth(a:text)) / 2

  return repeat(' ', l:padding) . a:text
endfun

fun! startscreen#custom_art()
  let l:win_width = winwidth(0)
  let l:win_height = winheight(0)

  let l:was_modifiable = &l:modifiable
  setlocal modifiable

  %delete _

  let l:art_height = len(s:ascii_art)
  let l:total_content_height = l:art_height + 4
  let l:top_padding = max([0, (l:win_height - l:total_content_height) / 2])

  call append(0, repeat([''], l:top_padding))

  let l:art_start = line('$') + 1

  for line in s:ascii_art
    call append(line('$'), startscreen#center_text(line, l:win_width))
  endfor

  let l:art_end = line('$')

  call append(line('$'), ['', ''])
  let l:message_index = localtime() % len(s:humiliation_messages)
  let l:message = s:humiliation_messages[l:message_index]
  let l:message_line = line('$') + 1

  call append(line('$'), startscreen#center_text(l:message, l:win_width))
  call append(line('$'), '')

  :1

  if !l:was_modifiable
    setlocal nomodifiable
  endif

  redraw!

  nnoremap <buffer> <silent> <Return> :enew<CR>:call startscreen#start()<CR>
  nnoremap <buffer> <silent> r :call startscreen#refresh()<CR>
endfun

fun! startscreen#refresh()
  call startscreen#custom_art()
endfun

if !exists('g:Startscreen_function')
  let g:Startscreen_function = function('startscreen#custom_art')
endif

fun! startscreen#start()
  if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
    return
  endif

  enew

  setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber

  call g:Startscreen_function()

  setlocal nomodifiable nomodified

  nnoremap <buffer><silent> e :enew<CR>
  nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> o :enew <bar> startinsert<CR><CR>
  nnoremap <buffer><silent> p :enew<CR>p
  nnoremap <buffer><silent> P :enew<CR>P
  nnoremap <buffer><silent> r :call startscreen#refresh()<CR>
endfun

augroup startscreen
  autocmd!
  autocmd VimEnter * call startscreen#start()
  autocmd VimResized * if &buftype ==# 'nofile' | call startscreen#custom_art() | endif
  autocmd WinEnter * if &buftype ==# 'nofile' && expand('%') == '' | call startscreen#custom_art() | endif
augroup end

let &cpo = s:save_cpo

unlet s:save_cpo
