runtime! ftplugin/man.vim

packadd! matchit

scriptencoding utf-8

filetype plugin indent on

autocmd BufWritePre * :%s/\s\+$//e

syntax enable

set background=dark
set termguicolors
set updatetime=300
set signcolumn=yes
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
set incsearch
set noswapfile
set foldmethod=syntax
set nofoldenable
set title
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}
set t_BE=

" colorscheme base16-black-metal-burzum
colorscheme candle-grey-transparent

augroup Binary
  au!
  au BufReadPre  *.bin,*.pcap set binary
  au BufReadPost *.bin,*.pcap silent %!xxd
  au BufWritePre *.bin,*.pcap silent %!xxd -r
  au BufWritePost *.bin,*.pcap silent %!xxd
augroup END
