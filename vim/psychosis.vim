" Psychosis Airline Theme
" Doruk Özer <dorukozer@protonmail.com>
" Colors are inherited from terminal ANSI Colors.

let s:bg          = [ '#000000', '16' ]
let s:pink        = [ '#B7306E', 5 ]
let s:green       = [ '#7DD275', 6 ]
let s:soft_purple = [ '#AB3FB1', 3 ]
let s:red         = [ '#CB2F2D', 1 ]
let s:soft_teal   = [ '#52D283', 4 ]

function! s:color_list(fg, bg) abort
    return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfunction

let g:airline#themes#psychosis#palette = {}

let s:modified = {
            \ 'airline_b': s:color_list(s:green, s:bg)
            \ }

let s:warning = s:color_list(s:bg, s:soft_purple)
let s:error = s:color_list(s:bg, s:red)

let s:airline_a_normal = s:color_list(s:bg, s:pink)
let s:airline_b_normal = s:color_list(s:pink, s:bg)
let s:airline_c_normal = s:color_list(s:pink, s:bg)
let g:airline#themes#psychosis#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#psychosis#palette.normal_modified = s:modified
let g:airline#themes#psychosis#palette.normal.airline_warning = s:warning
let g:airline#themes#psychosis#palette.normal_modified.airline_warning = s:warning
let g:airline#themes#psychosis#palette.normal.airline_error = s:error
let g:airline#themes#psychosis#palette.normal_modified.airline_error = s:error

let s:airline_a_insert = s:color_list(s:bg, s:green)
let s:airline_b_insert = s:color_list(s:green, s:bg)
let s:airline_c_insert = s:color_list(s:green, s:bg)
let g:airline#themes#psychosis#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#psychosis#palette.insert_modified = s:modified
let g:airline#themes#psychosis#palette.insert.airline_warning = s:warning
let g:airline#themes#psychosis#palette.insert_modified.airline_warning = s:warning
let g:airline#themes#psychosis#palette.insert.airline_error = s:error
let g:airline#themes#psychosis#palette.insert_modified.airline_error = s:error

let s:airline_a_visual = s:color_list(s:bg, s:soft_purple)
let s:airline_b_visual = s:color_list(s:soft_purple, s:bg)
let s:airline_c_visual = s:color_list(s:soft_purple, s:bg)
let g:airline#themes#psychosis#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#psychosis#palette.visual_modified = s:modified
let g:airline#themes#psychosis#palette.visual.airline_warning = s:warning
let g:airline#themes#psychosis#palette.visual_modified.airline_warning = s:warning
let g:airline#themes#psychosis#palette.visual.airline_error = s:error
let g:airline#themes#psychosis#palette.visual_modified.airline_error = s:error

let s:airline_a_replace = s:color_list(s:bg, s:soft_teal)
let s:airline_b_replace = s:color_list(s:soft_teal, s:bg)
let s:airline_c_replace = s:color_list(s:soft_teal, s:bg)
let g:airline#themes#psychosis#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)
let g:airline#themes#psychosis#palette.replace_modified = s:modified
let g:airline#themes#psychosis#palette.replace.airline_warning = s:warning
let g:airline#themes#psychosis#palette.replace_modified.airline_warning = s:warning
let g:airline#themes#psychosis#palette.replace.airline_error = s:error
let g:airline#themes#psychosis#palette.replace_modified.airline_error = s:error

let s:airline_a_inactive = s:color_list(s:green, s:bg)
let s:airline_b_inactive = s:color_list(s:green, s:bg)
let s:airline_c_inactive = s:color_list(s:green, s:bg)
let s:airline_x_inactive = s:color_list(s:bg, s:bg)
let s:airline_y_inactive = s:color_list(s:bg, s:bg)
let s:airline_z_inactive = s:color_list(s:bg, s:bg)
let g:airline#themes#psychosis#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive, s:airline_x_inactive, s:airline_y_inactive, s:airline_z_inactive)
let g:airline#themes#psychosis#palette.inactive_modified = s:modified

let s:airline_a_block = s:color_list(s:bg, s:soft_purple)
let s:airline_b_block = s:color_list(s:soft_purple, s:bg)
let s:airline_c_block = s:color_list(s:soft_purple, s:bg)
let g:airline#themes#psychosis#palette.visual_block = airline#themes#generate_color_map(s:airline_a_block, s:airline_b_block, s:airline_c_block)
let g:airline#themes#psychosis#palette.visual_block_modified = s:modified
let g:airline#themes#psychosis#palette.visual_block.airline_warning = s:warning
let g:airline#themes#psychosis#palette.visual_block.airline_error = s:error
