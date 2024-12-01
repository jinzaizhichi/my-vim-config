let g:NERDTreeAutoCenter=0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=0
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERDtree\d\+' && bufname('%') !~ 'NERDtree\d\+' && winnr('$') > 1 |
augroup nerdtreehidecwd
  autocmd!
  autocmd FileType nerdtree setlocal conceallevel=3
          \ | syntax match NERDTreeHideCWD #^[</].*$# conceal
          \ | setlocal concealcursor=n
augroup end
