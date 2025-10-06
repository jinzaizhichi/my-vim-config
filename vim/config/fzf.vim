let g:fzf_colors = {
      \ 'fg':      ['fg', 'Type'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'String'],
      \ 'fg+':     ['fg', 'Identifier'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'String'],
      \ 'info':    ['fg', 'Comment'],
      \ 'border':  ['fg', 'Comment'],
      \ 'prompt':  ['fg', 'Statement'],
      \ 'pointer': ['fg', 'Identifier'],
      \ 'marker':  ['fg', 'String'],
      \ 'spinner': ['fg', 'Comment'],
      \ 'header':  ['fg', 'Comment']
      \ }

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {
      \   'source': 'rg --files --hidden --follow --glob "!.git/*"',
      \   'window': { 'width': 1, 'height': 1, 'xoffset': 0 },
      \   'options': [
      \     '--preview',
      \     'bat -f --style=numbers --theme=base16 {}',
      \     '--border=none',
      \     '--preview-border=none',
      \     '--input-border=none',
      \   ]
      \ }, <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings '.
      \   '-- '.shellescape(<q-args>), 1,
      \   {
      \     'window': { 'width': 1, 'height': 1, 'xoffset': 0 },
      \     'options': [
      \       '--preview',
      \       'bat -f --style=numbers --theme=base16 {1} --highlight-line {2}',
      \       '--exact',
      \       '--border=none',
      \       '--preview-border=none',
      \       '--input-border=none',
      \     ]
      \   },
      \   <bang>0)

command! -bang -nargs=* Buffers
      \ call fzf#vim#buffers(<q-args>, {
      \   'window': { 'width': 1, 'height': 1, 'xoffset': 0 },
      \   'options': [
      \     '--preview',
      \     'echo {} | sed "s/.*\t//" | xargs -I% bat -f --style=numbers --theme=base16 %',
      \     '--border=none',
      \     '--preview-border=none',
      \     '--input-border=none',
      \   ]
      \ }, <bang>0)

command! -bang -range=% -nargs=* Commits
      \ let b:fzf_winview = winsaveview() |
      \ <line1>,<line2>call fzf#vim#commits(<q-args>,
      \   extend(fzf#vim#with_preview({ "placeholder": "" }), {
      \     'window': { 'width': 1, 'height': 1, 'xoffset': 0 },
      \     'options': get(fzf#vim#with_preview({ "placeholder": "" }), 'options', []) + [
      \       '--border=none',
      \       '--preview-border=none',
      \       '--input-border=none',
      \     ]
      \   }), <bang>0)
