" I wish I could understand and write something like this myself...
" https://github.com/arp242/startscreen.vim

scriptencoding utf-8
if exists('g:loaded_startscreen') | finish | endif
let g:loaded_startscreen = 1
let s:save_cpo = &cpo
set cpo&vim

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

fun! startscreen#start()
	if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
		return
	endif

	enew

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

	call g:Startscreen_function()

	setlocal nomodifiable nomodified

	nnoremap <buffer><silent> e :enew<CR>
	nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
	nnoremap <buffer><silent> o :enew <bar> startinsert<CR><CR>
	nnoremap <buffer><silent> p :enew<CR>p
	nnoremap <buffer><silent> P :enew<CR>P
endfun

augroup startscreen
	autocmd!
	autocmd VimEnter * call startscreen#start()
augroup end

let &cpo = s:save_cpo
unlet s:save_cpo
