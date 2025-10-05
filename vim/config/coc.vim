" Match FZF styling
hi link CocFloating Normal
hi CocFloatingSbar      ctermfg=0  ctermbg=NONE cterm=NONE
hi CocFloatingBorder    ctermfg=8  ctermbg=NONE cterm=NONE

" Selection
hi link CocMenuSel Statement
hi link CocListLine Normal

" Borders and dividers
hi CocFloatingDividingLine ctermfg=8  ctermbg=NONE cterm=NONE

" Documentation
hi CocMarkdownHeader    ctermfg=3  ctermbg=NONE cterm=bold
hi CocMarkdownCode      ctermfg=2  ctermbg=NONE cterm=NONE
hi CocMarkdownLink      ctermfg=6  ctermbg=NONE cterm=underline

" Diagnostic messages
hi CocErrorFloat        ctermfg=1  ctermbg=NONE cterm=NONE
hi CocWarningFloat      ctermfg=3  ctermbg=NONE cterm=NONE
hi CocInfoFloat         ctermfg=6  ctermbg=NONE cterm=NONE
hi CocHintFloat         ctermfg=5  ctermbg=NONE cterm=NONE

" Diagnostic signs
hi CocErrorSign         ctermfg=1  ctermbg=NONE cterm=bold
hi CocWarningSign       ctermfg=3  ctermbg=NONE cterm=bold
hi CocInfoSign          ctermfg=6  ctermbg=NONE cterm=NONE
hi CocHintSign          ctermfg=5  ctermbg=NONE cterm=NONE

" Virtual text
hi CocErrorVirtualText  ctermfg=1  ctermbg=NONE cterm=NONE
hi CocWarningVirtualText ctermfg=3  ctermbg=NONE cterm=NONE
hi CocInfoVirtualText   ctermfg=6  ctermbg=NONE cterm=NONE
hi CocHintVirtualText   ctermfg=5  ctermbg=NONE cterm=NONE

" Text styles
hi link CocBold Normal
hi link CocItalic Normal
hi link CocStrikeThrough Comment
hi link CocCodeLens Comment

" Semantic tokens
hi link CocSemTypeKeyword Statement
hi link CocSemTypeFunction Statement
hi link CocSemTypeVariable Identifier
hi link CocSemTypeComment Comment
hi link CocSemTypeString String
hi link CocSemTypeNumber Number
hi link CocSemTypeType Identifier

" Popup menu
hi link CocPumMenu Normal
hi link CocPumMenuSel Statement
hi link CocPumDetail Comment
hi link CocPumShortcut Comment
hi link CocPumDeprecated Comment

" Highlights
hi link CocSearch Statement
hi link CocHighlightText Statement
hi CocHighlightRead     ctermfg=2  ctermbg=NONE cterm=underline
hi CocHighlightWrite    ctermfg=1  ctermbg=NONE cterm=underline
