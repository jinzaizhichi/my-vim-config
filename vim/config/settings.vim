syntax on

hi LineNr ctermfg=8
hi VertSplit ctermbg=0 ctermfg=0 cterm=NONE
hi Search ctermbg=blue ctermfg=white
hi IncSearch ctermbg=lightblue ctermfg=black

set encoding=utf-8
set backspace=indent,eol,start
set fillchars=vert:\|,eob:\ 
set hlsearch
set wrap
set nu rnu
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set t_Co=16
set incsearch
set noswapfile
set foldmethod=syntax
set nofoldenable

filetype plugin indent on

scriptencoding utf-8

autocmd BufWritePre * :%s/\s\+$//e
