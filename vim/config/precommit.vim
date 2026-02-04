" Description: Custom TypeScript code checker with optional quickfix list
" population based on errors detected
"
" "format": "prettier --write src/**/*",
" "lint": "eslint --fix .",
" "type-check": "tsc --noEmit --pretty",
" "precommit": "yarn format && yarn lint && yarn type-check"
"
" Note: I usually have that 4 script above as exactly same in most of my
" projects, with this helper functions It's easier than ever to
" check/fix/navigate existing errors. `:CocDiagnostic` command checks open
" buffers only. Also this helper functions can become a nice baseline to
" extend anything else similiar
"
" Mapping: nnoremap <leader>rp :Precommit<CR>
" Usage: :Precommit

let s:state = { 'job': v:null, 'output': [], 'root': '' }

fu! s:get_project_root()
  let l:cwd = getcwd()
  if filereadable(l:cwd . '/package.json')
    retu l:cwd
  en
  let l:input = input('No package.json in cwd. Enter project path: ', l:cwd, 'dir')
  if l:input != '' && filereadable(l:input . '/package.json')
    retu l:input
  en
  retu ''
endfu

fu! s:run()
  if s:state.job != v:null
    echom 'Precommit already running...'
    retu
  en

  let s:state.root = s:get_project_root()
  if s:state.root == ''
    echom 'No valid project path provided'
    retu
  en

  let s:state.output = []

  echom 'Running precommit in ' . s:state.root . '...'

  let s:state.job = job_start(['sh', '-c', 'cd ' . shellescape(s:state.root) . ' && yarn precommit 2>&1'], {
        \ 'out_cb': function('s:on_output'),
        \ 'err_cb': function('s:on_output'),
        \ 'exit_cb': function('s:on_exit')
        \ })
endfu

fu! s:on_output(channel, msg)
  cal add(s:state.output, a:msg)
endfu

fu! s:on_exit(job, status)
  let s:state.job = v:null

  let l:errors = s:parse_errors(s:state.output)
  cal setqflist(l:errors)

  if len(l:errors) > 0
    copen
    echom 'Precommit found ' . len(l:errors) . ' error(s)'
  else
    cclose
    echom 'Precommit passed - no errors'
  en
endfu

" Parse eslint and TypeScript errors from output lines
"
" Vim regex reference: :help pattern-overview
" matchlist() returns [full_match, group1, group2, ...] or [] if no match
" See: :help matchlist()
"
fu! s:parse_errors(lines)
  let l:errors = []
  let l:current_file = ''

  for line in a:lines
    " ESLint file header (absolute path starting with /)
    if line =~ '^/'
      let l:current_file = line
      continue
    en

    " ESLint error format: "  15:7  error  message  rule-name"
    " Regex breakdown:
    "   ^           - start of line
    "   \s*         - optional leading whitespace
    "   \(\d\+\)    - capture group 1: one or more digits (line number)
    "   :           - literal colon separator
    "   \(\d\+\)    - capture group 2: one or more digits (column number)
    "   \s\+        - one or more whitespace chars
    "   \(error\|warning\)  - capture group 3: literal "error" OR "warning"
    "   \s\+        - one or more whitespace chars
    "   \(.*\)      - capture group 4: rest of line (error message + rule)
    let l:match = matchlist(line, '^\s*\(\d\+\):\(\d\+\)\s\+\(error\|warning\)\s\+\(.*\)')
    if len(l:match) > 0 && l:current_file != ''
      cal add(l:errors, {
            \ 'filename': l:current_file,
            \ 'lnum': str2nr(l:match[1]),
            \ 'col': str2nr(l:match[2]),
            \ 'type': l:match[3] == 'error' ? 'E' : 'W',
            \ 'text': l:match[4]
            \ })
    en

    " TypeScript error format: "src/file.ts(10,5): error TS2345: ..."
    " Regex breakdown:
    "   ^           - start of line
    "   \(.\+\.ts\) - capture group 1: any chars ending in .ts (filename)
    "   (           - literal opening paren
    "   \(\d\+\)    - capture group 2: digits (line number)
    "   ,           - literal comma
    "   \(\d\+\)    - capture group 3: digits (column number)
    "   )           - literal closing paren
    "   :\s*        - colon followed by optional whitespace
    "   error\s*    - literal "error" + optional whitespace
    "   \(.*\)      - capture group 4: rest of line (TS code + message)
    let l:ts_match = matchlist(line, '^\(.\+\.ts\)(\(\d\+\),\(\d\+\)):\s*error\s*\(.*\)')
    if len(l:ts_match) > 0
      cal add(l:errors, {
            \ 'filename': s:state.root . '/' . l:ts_match[1],
            \ 'lnum': str2nr(l:ts_match[2]),
            \ 'col': str2nr(l:ts_match[3]),
            \ 'type': 'E',
            \ 'text': l:ts_match[4]
            \ })
    en
  endfo

  retu l:errors
endfu

com! Precommit cal s:run()
