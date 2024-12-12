let s:bg           = [ '#0D0D0D', 0   ]
let s:bg_dark      = [ '#262626', 8   ]
let s:fg           = [ '#E8E8E8', 13  ]
let s:fg_dim       = [ '#363636', 13  ]
let s:main         = [ '#909D63', 13  ]
let s:red          = [ '#C47B7B', 1   ]
let s:purple       = [ '#B48EAD', 3   ]
let s:blue         = [ '#9B6B8F', 2   ]
let s:orange       = [ '#C4B27B', 173 ]
let s:yellow       = [ '#A4B49E', 180 ]

function! s:color_list(fg, bg) abort
    return [a:fg[0], a:bg[0], a:fg[1], a:bg[1]]
endfunction

let g:airline#themes#keta#palette = {}

let s:modified = {
            \ 'airline_c': s:color_list(s:orange, '')
            \ }
let s:warning = s:color_list(s:bg_dark, s:yellow)
let s:error = s:color_list(s:bg_dark, s:red)

let s:airline_a_normal = s:color_list(s:bg_dark, s:main)
let s:airline_b_normal = s:color_list(s:fg, s:bg)
let s:airline_c_normal = s:color_list(s:fg_dim, s:bg_dark)
let g:airline#themes#keta#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)
let g:airline#themes#keta#palette.normal_modified = s:modified
let g:airline#themes#keta#palette.normal.airline_warning = s:warning
let g:airline#themes#keta#palette.normal_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.normal.airline_error = s:error
let g:airline#themes#keta#palette.normal_modified.airline_error = s:error

let s:airline_a_insert = s:color_list(s:bg_dark, s:main)
let s:airline_b_insert = s:airline_b_normal
let s:airline_c_insert = s:airline_c_normal
let g:airline#themes#keta#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)
let g:airline#themes#keta#palette.insert_modified = s:modified
let g:airline#themes#keta#palette.insert.airline_warning = s:warning
let g:airline#themes#keta#palette.insert_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.insert.airline_error = s:error
let g:airline#themes#keta#palette.insert_modified.airline_error = s:error

let s:airline_a_replace = s:color_list(s:bg_dark, s:main)
let s:airline_b_replace = s:airline_b_normal
let s:airline_c_replace = s:airline_c_normal
let g:airline#themes#keta#palette.replace = airline#themes#generate_color_map(s:airline_a_replace, s:airline_b_replace, s:airline_c_replace)
let g:airline#themes#keta#palette.replace_modified = s:modified
let g:airline#themes#keta#palette.replace.airline_warning = s:warning
let g:airline#themes#keta#palette.replace_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.replace.airline_error = s:error
let g:airline#themes#keta#palette.replace_modified.airline_error = s:error

let s:airline_a_visual = s:color_list(s:bg_dark, s:main)
let s:airline_b_visual = s:airline_b_normal
let s:airline_c_visual = s:airline_c_normal
let g:airline#themes#keta#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#keta#palette.visual_modified = s:modified
let g:airline#themes#keta#palette.visual.airline_warning = s:warning
let g:airline#themes#keta#palette.visual_modified.airline_warning = s:warning
let g:airline#themes#keta#palette.visual.airline_error = s:error
let g:airline#themes#keta#palette.visual_modified.airline_error = s:error

let s:airline_a_inactive = s:color_list(s:fg_dim, s:bg)
let s:airline_b_inactive = s:color_list(s:fg_dim, s:bg_dark)
let s:airline_c_inactive = s:airline_b_inactive
let g:airline#themes#keta#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#keta#palette.inactive_modified = s:modified

let g:airline#themes#keta#palette.accents = {
            \ 'orange': s:color_list(s:orange, ''),
            \ 'blue': s:color_list(s:blue, ''),
            \ 'main': s:color_list(s:main, ''),
            \ 'purple': s:color_list(s:purple, ''),
            \ 'yellow': s:color_list(s:yellow, ''),
            \ 'red': s:color_list(s:red, '')
            \ }
