" reset leader key
let mapleader = "\<Space>"

" gotta develop that muscle memory, one way or another
noremap <up> :echoerr "Senpai, use k instead"<CR>
noremap <down> :echoerr "Senpai, use j instead"<CR>
noremap <left> :echoerr "Senpai, use h instead"<CR>
noremap <right> :echoerr "Senpai, use l instead"<CR>
inoremap <up> <NOP>
inoremap <down> <NOP>
inoremap <left> <NOP>
inoremap <right> <NOP>

nnoremap j gj
nnoremap k gk

" exit insert mode
inoremap jk <esc>

" fugitive
nnoremap <Leader>gs :G status<CR>
nnoremap <Leader>ga :G add .<CR>
nnoremap <Leader>gc :vertical G commit<CR>
nnoremap <Leader>gp :G push<CR>
nnoremap <Leader>gd :vertical G diff<CR>
nnoremap <Leader>gl :vertical G log<CR>

" open netrw
nnoremap <Leader>t :Explore<CR>

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
inoremap <silent><expr> <C-j> coc#refresh()
inoremap <silent><expr> <C-k><C-i> coc#rpc#request('doHover', [])
nnoremap <silent><expr> <C-k><C-i> CocActionAsync('doHover')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <Leader>ccd :call CocCopyDefinition()<CR>

" kisuke
nnoremap <Leader>ko :KisukeOpen<CR>
nnoremap <Leader>krs :KisukeResumeLastSession<CR>
nnoremap <Leader>km :KisukeMarkFocusedFile<CR>
vnoremap <Leader>kh :KisukeMarkHighlighted<CR>
nnoremap <leader>krc :KisukeRemoveLastMarkedCodeBlock<CR>
nnoremap <Leader>kc :KisukeCreateNewSession<CR>
nnoremap <Leader>kd :KisukeDeleteSession<CR>

" fzf
nnoremap <Leader>p :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>bb :Buffers<CR>

" buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bt :call BufferToggle()<CR>
nnoremap <leader>bda :%bdelete<Bar>edit #<Bar>normal`"<CR>
nnoremap <Leader>bdc :call BufferDeleteCurrent()<CR>

" increase/decrease pane width
nnoremap <Leader>ipw :vertical resize +10<CR>
nnoremap <Leader>dpw :vertical resize -10<CR>

" increase/decrease pane height
nnoremap <Leader>iph :resize +10<CR>
nnoremap <Leader>dph :resize -10<CR>

" save file
nnoremap <leader>s :w<CR>

" Search and replace word under cursor
nnoremap <leader>wr :%s/\<<C-r><C-w>\>//g<left><left>

" Visual mode: replace highlighted text with entered value
vnoremap <leader>pr y:%s/\V<C-r>=escape(@", '/\')<CR>//g<Left><Left>

" Visual mode: replace highlighted text with highlighted value + entered value
vnoremap <leader>pa y:%s/\V<C-r>=escape(@", '/\')<CR>/<C-r>=escape(@", '/\&~')<CR>/g<Left><Left>

" Auto-center screen after page navigation
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Auto-center screen after search navigation
nnoremap n nzz
nnoremap N Nzz

" Copying yanked text into system clipboard.
nnoremap y "+y
vnoremap y "+y
nnoremap Y "+Y
