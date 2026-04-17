runtime! ftplugin/man.vim
packadd! matchit
scriptencoding utf-8
filetype plugin indent on
syntax enable

" set background=dark
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
set foldenable
set foldlevelstart=99
set title
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}
set t_BE=

colorscheme base16-black-metal-venom
hi Normal guibg=NONE ctermbg=NONE
" colorscheme candle-grey-transparent

" autocmd BufWritePre * :%s/\s\+$//e

if has('mac')
  let g:fugitive_pty_debug_override = 0
endif
