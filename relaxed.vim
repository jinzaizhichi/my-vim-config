" Vim airline theme based on Relaxed terminal theme
" Palette definition
let s:gui00 = '#353a44'  " Background
let s:gui01 = '#3a3a3a'  " Darker gray
let s:gui02 = '#626262'  " Dark gray
let s:gui03 = '#808080'  " Medium gray
let s:gui04 = '#d9d9d9'  " Light gray
let s:gui05 = '#d9d9d9'  " White
let s:gui06 = '#f5f5f5'  " Bright white
let s:gui07 = '#f5f5f5'  " Pure white

" Mode-specific colors from Relaxed theme
let s:normal  = '#b46e99'  " Pink for normal mode (as requested)
let s:insert  = '#90a959'  " Green for insert mode
let s:visual  = '#6a87b5'  " Blue for visual mode
let s:replace = '#bc5653'  " Red for replace mode
let s:warning = '#ebbd5c'  " Yellow warning
let s:error   = '#bc5653'  " Red error

" Terminal colors
let s:cterm00 = '236'  " Background
let s:cterm01 = '237'
let s:cterm02 = '241'
let s:cterm03 = '244'
let s:cterm04 = '253'
let s:cterm05 = '253'
let s:cterm06 = '255'
let s:cterm07 = '255'

" Mode-specific terminal colors
let s:cterm_normal  = '132'  " Pink
let s:cterm_insert  = '107'  " Green
let s:cterm_visual  = '67'   " Blue
let s:cterm_replace = '131'  " Red
let s:cterm_warning = '179'  " Yellow
let s:cterm_error   = '131'  " Red

let g:airline#themes#relaxed#palette = {}

function! airline#themes#relaxed#refresh()
  " Accents
  let g:airline#themes#relaxed#palette.accents = {
        \ 'red': [ s:error, '', s:cterm_error, '' ]
        \ }

  " Normal mode - Pink
  let s:N1 = [ s:gui00, s:normal, s:cterm00, s:cterm_normal ]
  let s:N2 = [ s:normal, s:gui00, s:cterm_normal, s:cterm00 ]
  let s:N3 = [ s:normal, s:gui00, s:cterm_normal, s:cterm00 ]
  let g:airline#themes#relaxed#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  " Insert mode - Green
  let s:I1 = [ s:gui00, s:insert, s:cterm00, s:cterm_insert ]
  let s:I2 = [ s:insert, s:gui00, s:cterm_insert, s:cterm00 ]
  let s:I3 = [ s:insert, s:gui00, s:cterm_insert, s:cterm00 ]
  let g:airline#themes#relaxed#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

  " Replace mode - Red
  let s:R1 = [ s:gui00, s:replace, s:cterm00, s:cterm_replace ]
  let s:R2 = [ s:replace, s:gui00, s:cterm_replace, s:cterm00 ]
  let s:R3 = [ s:replace, s:gui00, s:cterm_replace, s:cterm00 ]
  let g:airline#themes#relaxed#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

  " Visual mode - Blue
  let s:V1 = [ s:gui00, s:visual, s:cterm00, s:cterm_visual ]
  let s:V2 = [ s:visual, s:gui00, s:cterm_visual, s:cterm00 ]
  let s:V3 = [ s:visual, s:gui00, s:cterm_visual, s:cterm00 ]
  let g:airline#themes#relaxed#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

  " Inactive mode
  let s:IA1 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let s:IA2 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let s:IA3 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let g:airline#themes#relaxed#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

  " Warning section
  let s:warning_group = [ s:gui00, s:warning, s:cterm00, s:cterm_warning ]
  let g:airline#themes#relaxed#palette.normal.airline_warning = s:warning_group
  let g:airline#themes#relaxed#palette.insert.airline_warning = s:warning_group
  let g:airline#themes#relaxed#palette.visual.airline_warning = s:warning_group
  let g:airline#themes#relaxed#palette.replace.airline_warning = s:warning_group

  " Error section
  let s:error_group = [ s:gui00, s:error, s:cterm00, s:cterm_error ]
  let g:airline#themes#relaxed#palette.normal.airline_error = s:error_group
  let g:airline#themes#relaxed#palette.insert.airline_error = s:error_group
  let g:airline#themes#relaxed#palette.visual.airline_error = s:error_group
  let g:airline#themes#relaxed#palette.replace.airline_error = s:error_group
endfunction

call airline#themes#relaxed#refresh()
