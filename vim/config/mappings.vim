" reset leader key
let mapleader = "\<Space>"

" fix arrow key behavior in insert mode
inoremap <Up> <Up>
inoremap <Down> <Down>
inoremap <Left> <Left>
inoremap <Right> <Right>

" coc open autocompletion tab
inoremap <silent><expr> <C-j> coc#refresh()
inoremap <silent><expr> <C-k><C-i> coc#rpc#request('doHover', [])
nnoremap <silent><expr> <C-k><C-i> CocActionAsync('doHover')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)

" nerdtree toggle
nnoremap <C-t> :NERDTreeToggle<CR>

" fzf toggle
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>

" buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <leader>bc :%bdelete<Bar>edit #<Bar>normal`"<CR>

" increase/decrease pane width
nnoremap <Leader>ipw :vertical resize +10<CR>
nnoremap <Leader>dpw :vertical resize -10<CR>

" increase/decrease pane height
nnoremap <Leader>iph :resize +10<CR>
nnoremap <Leader>dph :resize -10<CR>

" save file
nnoremap <leader>s :w<CR>
