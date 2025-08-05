let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \ }

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {
      \   'source': 'rg --files --hidden --follow --glob "!.git/*"',
      \   'options': [
      \     '--info=inline',
      \     '--preview',
      \     'bat -f --style=numbers --theme=base16 {}'
      \   ]
      \ }, <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings '.
      \   '-- '.shellescape(<q-args>), 1,
      \   {
      \     'options': [
      \       '--info=inline',
      \       '--preview',
      \       'bat -f --style=numbers --theme=base16 {1} --highlight-line {2}',
      \       '--exact',
      \     ]
      \   },
      \   <bang>0)
