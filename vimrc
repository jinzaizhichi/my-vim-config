let g:config_dir = '~/.vim/config/'

let g:config_files = [
    \ 'plugins.vim',
    \ 'mappings.vim',
    \ 'airline.vim',
    \ 'coc.vim',
    \ 'fastfold.vim',
    \ 'floaterm.vim',
    \ 'mappings.vim',
    \ 'nerdtree.vim',
    \ 'prettier.vim',
    \ 'settings.vim',
    \ 'startscreen.vim'
    \ ]

for config_file in g:config_files
    let full_path = expand(g:config_dir . config_file)

    if filereadable(full_path)
        execute 'source ' . full_path
    else
        echo "Warning: Configuration file " . full_path . " not found"
    endif
endfor
