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

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {
      \   'source': 'rg --files --hidden --follow --glob "!.git/*"',
      \   'window': { 'width': 0.9, 'height': 0.9, 'xoffset': 0.5, 'yoffset': 0.5, 'border': 'rounded' },
      \   'options': [
      \     '--preview',
      \     'bat -f --style=numbers --theme=burzum {}',
      \     '--preview-window', 'right:50%:wrap',
      \     '--bind', 'ctrl-/:toggle-preview',
      \     '--border=rounded',
      \     '--preview-border=none',
      \     '--input-border=none',
      \     '--color', 'fg:#c1c1c1,bg:#000000,hl:#ddeecc,fg+:#c1c1c1,bg+:#121212,hl+:#ddeecc',
      \     '--color', 'info:#888888,prompt:#999999,pointer:#ddeecc,marker:#ddeecc,spinner:#888888,header:#888888',
      \     '--color', 'border:#333333,gutter:#000000',
      \   ]
      \ }, <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --fixed-strings '.
      \   '-- '.shellescape(<q-args>), 1,
      \   {
      \     'window': { 'width': 0.9, 'height': 0.9, 'xoffset': 0.5, 'yoffset': 0.5, 'border': 'rounded' },
      \     'options': [
      \       '--preview',
      \       'bat -f --style=numbers --theme=burzum {1} --highlight-line {2}',
      \       '--preview-window', 'right:50%:wrap',
      \       '--bind', 'ctrl-/:toggle-preview',
      \       '--border=rounded',
      \       '--preview-border=none',
      \       '--input-border=none',
      \       '--color', 'fg:#c1c1c1,bg:#000000,hl:#ddeecc,fg+:#c1c1c1,bg+:#121212,hl+:#ddeecc',
      \       '--color', 'info:#888888,prompt:#999999,pointer:#ddeecc,marker:#ddeecc,spinner:#888888,header:#888888',
      \       '--color', 'border:#333333,gutter:#000000',
      \     ]
      \   },
      \   <bang>0)

command! -bang -nargs=* Buffers
      \ call fzf#vim#buffers(<q-args>, {
      \   'window': { 'width': 0.9, 'height': 0.9, 'xoffset': 0.5, 'yoffset': 0.5, 'border': 'rounded' },
      \   'options': [
      \     '--preview',
      \     'echo {} | sed "s/.*\t//" | xargs -I% bat -f --style=numbers --theme=burzum %',
      \     '--preview-window', 'right:50%:wrap',
      \     '--bind', 'ctrl-/:toggle-preview',
      \     '--border=rounded',
      \     '--preview-border=none',
      \     '--input-border=none',
      \     '--color', 'fg:#c1c1c1,bg:#000000,hl:#ddeecc,fg+:#c1c1c1,bg+:#121212,hl+:#ddeecc',
      \     '--color', 'info:#888888,prompt:#999999,pointer:#ddeecc,marker:#ddeecc,spinner:#888888,header:#888888',
      \     '--color', 'border:#333333,gutter:#000000',
      \   ]
      \ }, <bang>0)

command! -bang -range=% -nargs=* Commits
      \ let b:fzf_winview = winsaveview() |
      \ <line1>,<line2>call fzf#vim#commits(<q-args>,
      \   extend(fzf#vim#with_preview({ "placeholder": "" }), {
      \     'window': { 'width': 0.9, 'height': 0.9, 'xoffset': 0.5, 'yoffset': 0.5, 'border': 'rounded' },
      \     'options': get(fzf#vim#with_preview({ "placeholder": "" }), 'options', []) + [
      \       '--preview-window', 'right:50%:wrap',
      \       '--bind', 'ctrl-/:toggle-preview',
      \       '--border=rounded',
      \       '--preview-border=none',
      \       '--input-border=none',
      \       '--color', 'fg:#c1c1c1,bg:#000000,hl:#ddeecc,fg+:#c1c1c1,bg+:#121212,hl+:#ddeecc',
      \       '--color', 'info:#888888,prompt:#999999,pointer:#ddeecc,marker:#ddeecc,spinner:#888888,header:#888888',
      \       '--color', 'border:#333333,gutter:#000000',
      \     ]
      \   }), <bang>0)
