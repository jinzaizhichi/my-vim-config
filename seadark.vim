" Color palette
let s:gui00 = "#000000"  " Updated Background color to pitch black
let s:gui01 = "#1c1c1c"
let s:gui02 = "#4d4d4d"
let s:gui03 = "#7c7c99"
let s:gui04 = "#899ca1"
let s:gui05 = "#9fadb3"
let s:gui06 = "#cbe1e7"
let s:gui07 = "#d0d0d0"
let s:gui08 = "#0DB57D"  " Main accent color for all modes
let s:gui09 = "#0DB57D"  " Same as main color
let s:gui0A = "#7c7c99"
let s:gui0B = "#284e4e"
let s:gui0C = "#31658c"
let s:gui0D = "#0DB57D"  " Same as main color
let s:gui0E = "#0DB57D"  " Same as main color
let s:gui0F = "#0DB57D"  " Same as main color
let s:guiRed = "#FF5555" " Red accent for error section

let s:cterm00 = "16"  " Updated Background color (black)
let s:cterm01 = "234"
let s:cterm02 = "239"
let s:cterm03 = "103"
let s:cterm04 = "246"
let s:cterm05 = "247"
let s:cterm06 = "253"
let s:cterm07 = "252"
let s:cterm08 = "36"   " Main accent color
let s:cterm09 = "36"   " Same as main color
let s:cterm0A = "103"
let s:cterm0B = "23"
let s:cterm0C = "24"
let s:cterm0D = "36"   " Same as main color
let s:cterm0E = "36"   " Same as main color
let s:cterm0F = "36"   " Same as main color
let s:ctermRed = "203" " Red accent for error section

let g:airline#themes#seadark#palette = {}

function! airline#themes#seadark#refresh()
  let g:airline#themes#seadark#palette.accents = {
        \ 'red': [ s:guiRed, '', s:ctermRed, '' ]
        \ }

  " Normal mode
  let s:N1 = [ s:gui00, s:gui08, s:cterm00, s:cterm08 ]
  let s:N2 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let s:N3 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let g:airline#themes#seadark#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  " Insert mode
  let s:I1 = [ s:gui00, s:gui08, s:cterm00, s:cterm08 ]
  let s:I2 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let s:I3 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let g:airline#themes#seadark#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

  " Replace mode
  let s:R1 = [ s:gui00, s:gui08, s:cterm00, s:cterm08 ]
  let s:R2 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let s:R3 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let g:airline#themes#seadark#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

  " Visual mode
  let s:V1 = [ s:gui00, s:gui08, s:cterm00, s:cterm08 ]
  let s:V2 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let s:V3 = [ s:gui08, s:gui00, s:cterm08, s:cterm00 ]
  let g:airline#themes#seadark#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

  " Inactive mode
  let s:IA1 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let s:IA2 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let s:IA3 = [ s:gui04, s:gui00, s:cterm04, s:cterm00 ]
  let g:airline#themes#seadark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

  " Warning/Error styling
  let s:warning = [ s:gui00, s:gui0A, s:cterm00, s:cterm0A ]
  let s:error = [ s:gui00, s:guiRed, s:cterm00, s:ctermRed ]

  let g:airline#themes#seadark#palette.normal.airline_warning = s:warning
  let g:airline#themes#seadark#palette.insert.airline_warning = s:warning
  let g:airline#themes#seadark#palette.visual.airline_warning = s:warning
  let g:airline#themes#seadark#palette.replace.airline_warning = s:warning

  let g:airline#themes#seadark#palette.normal.airline_error = s:error
  let g:airline#themes#seadark#palette.insert.airline_error = s:error
  let g:airline#themes#seadark#palette.visual.airline_error = s:error
  let g:airline#themes#seadark#palette.replace.airline_error = s:error

endfunction

call airline#themes#seadark#refresh()
