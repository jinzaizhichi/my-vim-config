" Initialize some stuff
scriptencoding utf-8
if exists('g:loaded_startscreen') | finish | endif
let g:loaded_startscreen = 1
let s:save_cpo = &cpo
set cpo&vim

" Options

" The default function; show a fortune
fun! startscreen#fortune()
	let l:fortune = systemlist('fortune')
	call append('0', ['', ''] + map(l:fortune, '"        " . v:val'))
	:1
	redraw!

	" Moar fortunes! :-)
	nnoremap <buffer> <silent> <Return> :enew<CR>:call startscreen#start()<CR>
endfun

if !exists('g:Startscreen_function')
	let g:Startscreen_function = function('startscreen#fortune')
endif


" Set a fancy start screen
fun! startscreen#start()
	" Don't run if:
	" - there are commandline arguments;
	" - the buffer isn't empty (e.g. cmd | vi -);
	" - we're not invoked as vim or gvim;
	" - we're starting in insert mode.
	if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
		return
	endif

	" Start a new buffer...
	enew

	" ...and set some options for it
	setlocal
		\ bufhidden=wipe
		\ buftype=nofile
		\ nobuflisted
		\ nocursorcolumn
		\ nocursorline
		\ nolist
		\ nonumber
		\ noswapfile
		\ norelativenumber

	" Now we can just write to the buffer whatever you want.
	call g:Startscreen_function()

	" No modifications to this buffer
	setlocal nomodifiable nomodified

	" When we go to insert mode start a new buffer, and start insert
	nnoremap <buffer><silent> e :enew<CR>
	nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
	nnoremap <buffer><silent> o :enew <bar> startinsert<CR><CR>
	nnoremap <buffer><silent> p :enew<CR>p
	nnoremap <buffer><silent> P :enew<CR>P
endfun

" Auto command
augroup startscreen
	autocmd!
	autocmd VimEnter * call startscreen#start()
augroup end


let &cpo = s:save_cpo
unlet s:save_cpo
