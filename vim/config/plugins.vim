call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'cohama/lexima.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'konfekt/fastfold'
Plug 'sheerun/vim-polyglot'
Plug 'edkolev/tmuxline.vim'

call plug#end()
