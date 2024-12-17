hi LineNr ctermfg=8                         " line number coloring
set fillchars=vert:\|,eob:\                 " split bar and end of buffer styling
hi VertSplit ctermbg=8 ctermfg=8 cterm=NONE " Split character coloring
set hlsearch                                " highlight search results
set nocompatible                            " set compatibility to vim only
set backspace=indent,eol,start              " remap backspace key
set wrap                                    " automatically wrap text that extends beyond the screen length
scriptencoding utf-8
set encoding=utf-8                          " encoding
set nu rnu                                  " show line numbers
filetype plugin indent on                   " must look into help for this
set statusline=1                            " status line
set expandtab                               " must look into help for this
set tabstop=2                               " must look into help for this
set softtabstop=2                           " must look into help for this
set shiftwidth=2                            " must look into help for this
set foldmethod=syntax                       " setting fold method
set nofoldenable                            " dont fold on load
set t_Co=16                                 " colors
set incsearch                               " Incremental search, hit `<CR>` to stop.
set noswapfile                              " disable swap files
set shortmess-=S                            " show matching count when doing search
