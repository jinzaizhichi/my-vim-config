runtime! ftplugin/man.vim
packadd! matchit

filetype plugin indent on

scriptencoding utf-8

autocmd BufWritePre * :%s/\s\+$//e

set background=dark
set encoding=utf-8
set backspace=indent,eol,start
set fillchars=eob:\ ,vert:\|
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

syntax on

colorscheme black-metal-burzum
