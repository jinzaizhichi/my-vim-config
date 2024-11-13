" Color palette based on Wryan terminal theme
let s:gui00 = "#101010"  " Background
let s:gui01 = "#1c1c1c"
let s:gui02 = "#4d4d4d"
let s:gui03 = "#7c7c99"
let s:gui04 = "#899ca1"
let s:gui05 = "#9fadb3"
let s:gui06 = "#cbe1e7"
let s:gui07 = "#d0d0d0"

" Mode-specific colors from Wryan theme
let s:normal  = "#3959c4"  " Blue for normal mode
let s:insert  = "#284e4e"  " Green for insert mode
let s:visual  = "#7e5d9e"  " Purple for visual mode
let s:replace = "#8c465b"  " Red for replace mode

let s:warning = "#7c7c99"  " Yellow warning
let s:error   = "#8c465b"  " Red error

" Terminal colors
let s:cterm00 = "233"  " Background
let s:cterm01 = "234"
let s:cterm02 = "239"
let s:cterm03 = "103"
let s:cterm04 = "246"
let s:cterm05 = "247"
let s:cterm06 = "253"
let s:cterm07 = "252"

" Mode-specific terminal colors
let s:cterm_normal  = "68"   " Blue
let s:cterm_insert  = "23"   " Green
let s:cterm_visual  = "97"   " Purple
let s:cterm_replace = "95"   " Red
let s:cterm_warning = "103"  " Yellow
let s:cterm_error   = "131"  " Red

let g:airline#themes#wryan#palette = {}

function! airline#themes#wryan#refresh()
  " Accents
  let g:airline#themes#wryan#palette.accents = {
        \ 'red': [ s:error, '', s:cterm_error, '' ]
        \ }

  " Normal mode
  let s:N1 = [ s:gui00, s:normal, s:cterm00, s:cterm_normal ]
  let s:N2 = [ s:normal, s:gui00, s:cterm_normal, s:cterm00 ]
  let s:N3 = [ s:normal, s:gui00, s:cterm_normal, s:cterm00 ]
  let g:airline#themes#wryan#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  " Insert mode - Green
  let s:I1 = [ s:gui00, s:insert, s:cterm00, s:cterm_insert ]
  let s:I2 = [ s:insert, s:gui00, s:cterm_insert, s:cterm00 ]
  let s:I3 = [ s:insert, s:gui00, s:cterm_insert, s:cterm00 ]
  let g:airline#themes#wryan#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

  " Replace mode - Red
  let s:R1 = [ s:gui00, s:replace, s:cterm00, s:cterm_replace ]
  let s:R2 = [ s:replace, s:gui00, s:cterm_replace, s:cterm00 ]
  let s:R3 = [ s:replace, s:gui00, s:cterm_replace, s:cterm00 ]
  let g:airline#themes#wryan#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

  " Visual mode - Purple
  let s:V1 = [ s:gui00, s:visual, s:cterm00, s:cterm_visual ]
  let s:V2 = [ s:visual, s:gui00, s:cterm_visual, s:cterm00 ]
  let s:V3 = [ s:visual, s:gui00, s:cterm_visual, s:cterm00 ]
  let g:airline#themes#wryan#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

  " Inactive mode
  let s:IA1 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let s:IA2 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let s:IA3 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let g:airline#themes#wryan#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

  " Warning section
  let s:warning_group = [ s:gui00, s:warning, s:cterm00, s:cterm_warning ]
  let g:airline#themes#wryan#palette.normal.airline_warning = s:warning_group
  let g:airline#themes#wryan#palette.insert.airline_warning = s:warning_group
  let g:airline#themes#wryan#palette.visual.airline_warning = s:warning_group
  let g:airline#themes#wryan#palette.replace.airline_warning = s:warning_group

  " Error section
  let s:error_group = [ s:gui00, s:error, s:cterm00, s:cterm_error ]
  let g:airline#themes#wryan#palette.normal.airline_error = s:error_group
  let g:airline#themes#wryan#palette.insert.airline_error = s:error_group
  let g:airline#themes#wryan#palette.visual.airline_error = s:error_group
  let g:airline#themes#wryan#palette.replace.airline_error = s:error_group
endfunction

call airline#themes#wryan#refresh()
