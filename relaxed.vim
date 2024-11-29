let s:bg           = [ '#353A44', 236 ]
let s:bg_dark      = [ '#2B303B', 235 ]
let s:fg           = [ '#C0C5CE', 251 ]
let s:fg_dim       = [ '#65737E', 243 ]
let s:main         = [ '#909D63', 108 ]  " Main olive green color
let s:red          = [ '#BC5653', 131 ]  " Red for replace mode
let s:purple       = [ '#B06698', 132 ]  " Purple for visual mode
let s:blue         = [ '#6A8799', 66  ]  " Blue for insert mode
let s:orange       = [ '#D19A66', 173 ]
let s:yellow       = [ '#E5C07B', 180 ]

function! s:color_list(fg, bg) abort
  return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfunction

let g:airline#themes#relaxed#palette = {}

let s:modified = {
  \ 'airline_c': s:color_list(s:orange, '')
  \ }
let s:warning = s:color_list(s:bg_dark, s:yellow)
let s:error = s:color_list(s:bg_dark, s:red)

" Normal mode - using main olive green
let s:airline_a_normal = s:color_list(s:bg_dark, s:main)
let s:airline_b_normal = s:color_list(s:fg, s:bg)
let s:airline_c_normal = s:color_list(s:fg_dim, s:bg_dark)
let g:airline#themes#relaxed#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#relaxed#palette.normal_modified = s:modified
let g:airline#themes#relaxed#palette.normal.airline_warning = s:warning
let g:airline#themes#relaxed#palette.normal_modified.airline_warning = s:warning
let g:airline#themes#relaxed#palette.normal.airline_error = s:error
let g:airline#themes#relaxed#palette.normal_modified.airline_error = s:error

" Insert mode - using blue
let s:airline_a_insert = s:color_list(s:bg_dark, s:blue)
let s:airline_b_insert = s:airline_b_normal
let s:airline_c_insert = s:airline_c_normal
let g:airline#themes#relaxed#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#relaxed#palette.insert_modified = s:modified
let g:airline#themes#relaxed#palette.insert.airline_warning = s:warning
let g:airline#themes#relaxed#palette.insert_modified.airline_warning = s:warning
let g:airline#themes#relaxed#palette.insert.airline_error = s:error
let g:airline#themes#relaxed#palette.insert_modified.airline_error = s:error

" Replace mode - using red
let s:airline_a_replace = s:color_list(s:bg_dark, s:red)
let s:airline_b_replace = s:airline_b_normal
let s:airline_c_replace = s:airline_c_normal
let g:airline#themes#relaxed#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)
let g:airline#themes#relaxed#palette.replace_modified = s:modified
let g:airline#themes#relaxed#palette.replace.airline_warning = s:warning
let g:airline#themes#relaxed#palette.replace_modified.airline_warning = s:warning
let g:airline#themes#relaxed#palette.replace.airline_error = s:error
let g:airline#themes#relaxed#palette.replace_modified.airline_error = s:error

" Visual mode - using purple
let s:airline_a_visual = s:color_list(s:bg_dark, s:purple)
let s:airline_b_visual = s:airline_b_normal
let s:airline_c_visual = s:airline_c_normal
let g:airline#themes#relaxed#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#relaxed#palette.visual_modified = s:modified
let g:airline#themes#relaxed#palette.visual.airline_warning = s:warning
let g:airline#themes#relaxed#palette.visual_modified.airline_warning = s:warning
let g:airline#themes#relaxed#palette.visual.airline_error = s:error
let g:airline#themes#relaxed#palette.visual_modified.airline_error = s:error

" Inactive mode
let s:airline_a_inactive = s:color_list(s:fg_dim, s:bg)
let s:airline_b_inactive = s:color_list(s:fg_dim, s:bg_dark)
let s:airline_c_inactive = s:airline_b_inactive
let g:airline#themes#relaxed#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#relaxed#palette.inactive_modified = s:modified

" Accents
let g:airline#themes#relaxed#palette.accents = {
  \ 'orange': s:color_list(s:orange, ''),
  \ 'blue': s:color_list(s:blue, ''),
  \ 'main': s:color_list(s:main, ''),
  \ 'purple': s:color_list(s:purple, ''),
  \ 'yellow': s:color_list(s:yellow, ''),
  \ 'red': s:color_list(s:red, '')
  \ }
