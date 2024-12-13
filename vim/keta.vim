" Keta Theme
" Doruk Özer <dorukozer@protonmail.com>

let s:bg       = [ '#141414', 8 ]
let s:bg_light = [ '#1E1E1E', 0 ]
let s:pink     = [ '#B48EAD', 5 ]
let s:green    = [ '#A4B49E', 6 ]
let s:yellow   = [ '#C4B27B', 3 ]
let s:red      = [ '#C47B7B', 1 ]
let s:purple   = [ '#9B6B8F', 4 ]

function! s:color_list(fg, bg) abort
    return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfunction

let g:airline#themes#keta#palette = {}

let s:modified = {
            \ 'airline_b': s:color_list(s:green, '')
            \ }

let s:warning = s:color_list(s:bg, s:yellow)
let s:error = s:color_list(s:bg, s:red)

let s:airline_a_normal = s:color_list(s:bg, s:pink)
let s:airline_b_normal = s:color_list(s:pink, s:bg_light)
let s:airline_c_normal = s:color_list(s:pink, s:bg)
let g:airline#themes#keta#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#keta#palette.normal_modified = s:modified
let g:airline#themes#keta#palette.normal.airline_warning = s:warning
let g:airline#themes#keta#palette.normal_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.normal.airline_error = s:error
let g:airline#themes#keta#palette.normal_modified.airline_error = s:error

let s:airline_a_insert = s:color_list(s:bg, s:green)
let s:airline_b_insert = s:color_list(s:green, s:bg_light)
let s:airline_c_insert = s:color_list(s:green, s:bg)
let g:airline#themes#keta#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#keta#palette.insert_modified = s:modified
let g:airline#themes#keta#palette.insert.airline_warning = s:warning
let g:airline#themes#keta#palette.insert_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.insert.airline_error = s:error
let g:airline#themes#keta#palette.insert_modified.airline_error = s:error

let s:airline_a_visual = s:color_list(s:bg, s:yellow)
let s:airline_b_visual = s:color_list(s:yellow, s:bg_light)
let s:airline_c_visual = s:color_list(s:yellow, s:bg)
let g:airline#themes#keta#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#keta#palette.visual_modified = s:modified
let g:airline#themes#keta#palette.visual.airline_warning = s:warning
let g:airline#themes#keta#palette.visual_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.visual.airline_error = s:error
let g:airline#themes#keta#palette.visual_modified.airline_error = s:error

let s:airline_a_replace = s:color_list(s:bg, s:purple)
let s:airline_b_replace = s:color_list(s:purple, s:bg_light)
let s:airline_c_replace = s:color_list(s:purple, s:bg_light)
let g:airline#themes#keta#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)
let g:airline#themes#keta#palette.replace_modified = s:modified
let g:airline#themes#keta#palette.replace.airline_warning = s:warning
let g:airline#themes#keta#palette.replace_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.replace.airline_error = s:error
let g:airline#themes#keta#palette.replace_modified.airline_error = s:error

let s:airline_a_inactive = s:airline_a_normal
let s:airline_b_inactive = s:airline_b_normal
let s:airline_c_inactive = s:airline_c_normal
let g:airline#themes#keta#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#keta#palette.inactive_modified = s:modified
