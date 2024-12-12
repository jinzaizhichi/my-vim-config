hi LineNr ctermfg=8                         " line number coloring
set fillchars=vert:\|,eob:\                 " split bar and end of buffer styling
hi VertSplit ctermbg=0 ctermfg=0 cterm=NONE " Split character coloring
set hlsearch                                " highlight search results
set nocompatible                            " set compatibility to vim only
set backspace=indent,eol,start              " remap backspace key
set wrap                                    " automatically wrap text that extends beyond the screen length
set encoding=utf-8                          " encoding
set nu rnu                                  " show line numbers
filetype plugin indent on                   " must look into help for this
set expandtab                               " must look into help for this
set tabstop=2                               " must look into help for this
set softtabstop=2                           " must look into help for this
set shiftwidth=2                            " must look into help for this
set foldmethod=syntax                       " setting fold method
set nofoldenable                            " dont fold on load
set laststatus=2                            " status bar
set t_Co=16                                 " colors
set incsearch                               " Incremental search, hit `<CR>` to stop.
set noswapfile                              " disable swap files
set shortmess-=S                            " show matching count when doing search
set nocursorline                            " initially disable cursorline
highlight CursorLine ctermbg=5 ctermfg=0    " cursorline coloring
autocmd InsertEnter * set cursorline        " enable cursorline when entering insert mode
autocmd InsertLeave * set nocursorline      " disable cursorline when leaving insert mode
