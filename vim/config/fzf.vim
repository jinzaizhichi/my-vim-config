let g:fzf_colors = {
      \ 'fg':      ['fg', 'Type'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Statement'],
      \ 'fg+':     ['fg', 'Statement'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'String'],
      \ 'info':    ['fg', 'Comment'],
      \ 'border':  ['fg', 'FZFBorder'],
      \ 'prompt':  ['fg', 'Statement'],
      \ 'pointer': ['fg', 'Identifier'],
      \ 'marker':  ['fg', 'String'],
      \ 'spinner': ['fg', 'Comment'],
      \ 'header':  ['fg', 'Comment']
      \ }


if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '100%,100%' }
else
  let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
endif

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {
      \   'source': 'rg --files --hidden --follow --glob "!.git/*"',
      \   'options': [
      \     '--preview',
      \     'bat -f --style=numbers --theme=burzum {}',
      \     '--preview-window', 'right:50%:wrap',
      \     '--bind', 'ctrl-/:toggle-preview',
      \   ]
      \ }, <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings '.
      \   '-- '.shellescape(<q-args>), 1,
      \   {
      \     'options': [
      \       '--preview',
      \       'bat -f --style=numbers --theme=burzum {1} --highlight-line {2}',
      \       '--preview-window', 'right:50%:wrap',
      \       '--bind', 'ctrl-/:toggle-preview',
      \     ]
      \   },
      \   <bang>0)

command! -bang -nargs=* Buffers
      \ call fzf#vim#buffers(<q-args>, {
      \   'options': [
      \     '--preview',
      \     'echo {} | sed "s/.*\t//" | xargs -I% bat -f --style=numbers --theme=burzum %',
      \     '--preview-window', 'right:50%:wrap',
      \     '--bind', 'ctrl-/:toggle-preview',
      \   ]
      \ }, <bang>0)

command! -bang -range=% -nargs=* Commits
      \ let b:fzf_winview = winsaveview() |
      \ <line1>,<line2>call fzf#vim#commits(<q-args>,
      \   extend(fzf#vim#with_preview({ "placeholder": "" }), {
      \     'options': get(fzf#vim#with_preview({ "placeholder": "" }), 'options', []) + [
      \       '--preview-window', 'right:50%:wrap',
      \       '--bind', 'ctrl-/:toggle-preview',
      \     ]
      \   }), <bang>0)
