highlight CocFloating ctermbg=NONE ctermfg=15
highlight CocMenuSel ctermbg=NONE ctermfg=5
highlight CocErrorFloat ctermbg=NONE ctermfg=1
highlight CocWarningFloat ctermbg=NONE ctermfg=3
highlight CocInfoFloat ctermbg=NONE ctermfg=7
highlight CocHintFloat ctermbg=NONE ctermfg=7
highlight CocCursorRange ctermbg=NONE ctermfg=5
highlight CocBorder ctermbg=NONE ctermfg=0
highlight CocPrompt ctermbg=NONE ctermfg=6

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
