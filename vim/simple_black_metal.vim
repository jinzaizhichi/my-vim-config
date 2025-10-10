" Custom Black Metal Airline Theme
" Doruk Özer <dorukozer@protonmail.com>
" Colors match wezterm ansi palette

" base
let s:bg        = [ '#000000', 16 ]
let s:white     = [ '#c1c1c1', 7  ]

" mode colors - ansi 1-4
let s:teal      = [ '#486e6f', 1  ]  " insert
let s:pink      = [ '#dd9999', 2  ]  " normal
let s:red       = [ '#a06666', 3  ]  " visual
let s:gray      = [ '#888888', 4  ]  " replace

" status colors
let s:yellow    = [ '#99bbaa', 3  ]  " warnings
let s:dark_gray = [ '#999999', 5  ]  " errors

function! s:color_list(fg, bg) abort
    return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfunction

let g:airline#themes#simple_black_metal#palette = {}

let s:modified = {
            \ 'airline_b': s:color_list(s:pink, s:bg)
            \ }

let s:warning = s:color_list(s:bg, s:yellow)
let s:error = s:color_list(s:bg, s:dark_gray)

" normal mode - pink/ansi 2
let s:airline_a_normal = s:color_list(s:bg, s:pink)
let s:airline_b_normal = s:color_list(s:pink, s:bg)
let s:airline_c_normal = s:color_list(s:pink, s:bg)
let g:airline#themes#simple_black_metal#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#simple_black_metal#palette.normal_modified = s:modified
let g:airline#themes#simple_black_metal#palette.normal.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.normal_modified.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.normal.airline_error = s:error
let g:airline#themes#simple_black_metal#palette.normal_modified.airline_error = s:error

" insert mode - teal/ansi 1
let s:airline_a_insert = s:color_list(s:bg, s:teal)
let s:airline_b_insert = s:color_list(s:teal, s:bg)
let s:airline_c_insert = s:color_list(s:teal, s:bg)
let g:airline#themes#simple_black_metal#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#simple_black_metal#palette.insert_modified = s:modified
let g:airline#themes#simple_black_metal#palette.insert.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.insert_modified.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.insert.airline_error = s:error
let g:airline#themes#simple_black_metal#palette.insert_modified.airline_error = s:error

" visual mode - red/ansi 3
let s:airline_a_visual = s:color_list(s:bg, s:red)
let s:airline_b_visual = s:color_list(s:red, s:bg)
let s:airline_c_visual = s:color_list(s:red, s:bg)
let g:airline#themes#simple_black_metal#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#simple_black_metal#palette.visual_modified = s:modified
let g:airline#themes#simple_black_metal#palette.visual.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.visual_modified.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.visual.airline_error = s:error
let g:airline#themes#simple_black_metal#palette.visual_modified.airline_error = s:error

" replace mode - gray/ansi 4
let s:airline_a_replace = s:color_list(s:bg, s:gray)
let s:airline_b_replace = s:color_list(s:gray, s:bg)
let s:airline_c_replace = s:color_list(s:gray, s:bg)
let g:airline#themes#simple_black_metal#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)
let g:airline#themes#simple_black_metal#palette.replace_modified = s:modified
let g:airline#themes#simple_black_metal#palette.replace.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.replace_modified.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.replace.airline_error = s:error
let g:airline#themes#simple_black_metal#palette.replace_modified.airline_error = s:error

" inactive windows
let s:airline_a_inactive = s:color_list(s:pink, s:bg)
let s:airline_b_inactive = s:color_list(s:pink, s:bg)
let s:airline_c_inactive = s:color_list(s:pink, s:bg)
let s:airline_x_inactive = s:color_list(s:bg, s:bg)
let s:airline_y_inactive = s:color_list(s:bg, s:bg)
let s:airline_z_inactive = s:color_list(s:bg, s:bg)
let g:airline#themes#simple_black_metal#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive, s:airline_x_inactive, s:airline_y_inactive, s:airline_z_inactive)
let g:airline#themes#simple_black_metal#palette.inactive_modified = s:modified

" visual block - same as visual
let s:airline_a_block = s:color_list(s:bg, s:red)
let s:airline_b_block = s:color_list(s:red, s:bg)
let s:airline_c_block = s:color_list(s:red, s:bg)
let g:airline#themes#simple_black_metal#palette.visual_block = airline#themes#generate_color_map(s:airline_a_block, s:airline_b_block, s:airline_c_block)
let g:airline#themes#simple_black_metal#palette.visual_block_modified = s:modified
let g:airline#themes#simple_black_metal#palette.visual_block.airline_warning = s:warning
let g:airline#themes#simple_black_metal#palette.visual_block.airline_error = s:error
