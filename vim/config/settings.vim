syntax on

hi VertSplit ctermbg=0 ctermfg=0 cterm=NONE
hi Search ctermfg=0 ctermbg=3
hi IncSearch ctermfg=0 ctermbg=11
hi MatchParen cterm=bold ctermfg=14 ctermbg=NONE gui=bold  guibg=NONE
hi Visual cterm=NONE ctermfg=NONE ctermbg=238 gui=NONE guifg=NONE
hi CursorLine cterm=NONE ctermbg=235 gui=NONE
hi CursorColumn cterm=NONE ctermbg=235 gui=NONE
hi LineNr ctermfg=240
hi CursorLineNr cterm=bold ctermfg=11 gui=bold
hi Pmenu ctermfg=15 ctermbg=236
hi PmenuSel ctermfg=0 ctermbg=11
hi PmenuSbar ctermbg=238
hi PmenuThumb ctermbg=245
hi Comment ctermfg=244
hi Error ctermfg=15 ctermbg=1
hi ErrorMsg ctermfg=0 ctermbg=1
hi WarningMsg ctermfg=0 ctermbg=11
hi DiffAdd ctermbg=22
hi DiffChange ctermbg=17
hi DiffDelete ctermfg=52 ctermbg=52
hi DiffText cterm=bold ctermbg=18 gui=bold

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

filetype plugin indent on

scriptencoding utf-8

autocmd BufWritePre * :%s/\s\+$//e

runtime! ftplugin/man.vim
packadd! matchit
