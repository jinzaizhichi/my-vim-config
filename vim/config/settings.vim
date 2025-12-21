runtime! ftplugin/man.vim
packadd! matchit

filetype plugin indent on

scriptencoding utf-8

autocmd BufWritePre * :%s/\s\+$//e

syntax enable
set background=dark
set termguicolors
colorscheme base16-black-metal-burzum
" set background=light
" colorscheme solarized

" FZF border color to match colorscheme
highlight FZFBorder guifg=#333333 ctermfg=8

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

" set title to render it in tmux panes
" set title
" set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}

" Fix paste mode issues
set t_BE=

augroup Binary
  au!
  au BufReadPre  *.bin,*.pcap set binary
  au BufReadPost *.bin,*.pcap silent %!xxd
  au BufWritePre *.bin,*.pcap silent %!xxd -r
  au BufWritePost *.bin,*.pcap silent %!xxd
augroup END
