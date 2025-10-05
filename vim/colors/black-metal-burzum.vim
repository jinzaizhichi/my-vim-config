set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "black-metal-burzum"

set t_Co=16
set notermguicolors

" Core editor highlights
hi Normal       ctermfg=7  ctermbg=NONE cterm=NONE
hi NonText      ctermfg=8  ctermbg=NONE cterm=NONE
hi EndOfBuffer  ctermfg=8  ctermbg=NONE cterm=NONE
hi LineNr       ctermfg=8  ctermbg=NONE cterm=NONE
hi CursorLineNr ctermfg=11 ctermbg=NONE cterm=bold
hi CursorLine   ctermfg=NONE ctermbg=8  cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=8  cterm=NONE
hi ColorColumn  ctermfg=NONE ctermbg=8  cterm=NONE
hi SignColumn   ctermfg=7  ctermbg=NONE cterm=NONE
hi VertSplit    ctermbg=0  ctermfg=0    cterm=NONE
hi StatusLine   ctermfg=7  ctermbg=8    cterm=NONE
hi StatusLineNC ctermfg=8  ctermbg=0    cterm=NONE
hi TabLine      ctermfg=8  ctermbg=0    cterm=NONE
hi TabLineFill  ctermfg=8  ctermbg=0    cterm=NONE
hi TabLineSel   ctermfg=11 ctermbg=8    cterm=bold

" Cursor and visual selection
hi Cursor       ctermfg=0  ctermbg=7    cterm=NONE
hi Visual       ctermfg=5  ctermbg=8    cterm=NONE
hi VisualNOS    ctermfg=5  ctermbg=8    cterm=NONE

" Search and matches
hi Search       ctermfg=0  ctermbg=11   cterm=NONE
hi IncSearch    ctermfg=0  ctermbg=3    cterm=NONE
hi MatchParen   ctermfg=2  ctermbg=5    cterm=NONE

" Popup menu
hi Pmenu        ctermfg=7  ctermbg=8    cterm=NONE
hi PmenuSel     ctermfg=0  ctermbg=11   cterm=NONE
hi PmenuSbar    ctermfg=NONE ctermbg=8  cterm=NONE
hi PmenuThumb   ctermfg=NONE ctermbg=7  cterm=NONE
hi WildMenu     ctermfg=0  ctermbg=11   cterm=NONE

" Messages and prompts
hi ErrorMsg     ctermfg=0  ctermbg=1    cterm=bold
hi WarningMsg   ctermfg=0  ctermbg=3    cterm=NONE
hi ModeMsg      ctermfg=11 ctermbg=NONE cterm=NONE
hi MoreMsg      ctermfg=2  ctermbg=NONE cterm=NONE
hi Question     ctermfg=11 ctermbg=NONE cterm=NONE

" Folding
hi Folded       ctermfg=8  ctermbg=0    cterm=NONE
hi FoldColumn   ctermfg=8  ctermbg=NONE cterm=NONE

" Diff mode
hi DiffAdd      ctermfg=2  ctermbg=0    cterm=NONE
hi DiffChange   ctermfg=3  ctermbg=0    cterm=NONE
hi DiffDelete   ctermfg=1  ctermbg=0    cterm=NONE
hi DiffText     ctermfg=11 ctermbg=8    cterm=bold

" Spell checking
hi SpellBad     ctermfg=1  ctermbg=NONE cterm=underline
hi SpellCap     ctermfg=3  ctermbg=NONE cterm=underline
hi SpellLocal   ctermfg=5  ctermbg=NONE cterm=underline
hi SpellRare    ctermfg=6  ctermbg=NONE cterm=underline

" Syntax highlighting groups
hi Comment      ctermfg=8  ctermbg=NONE cterm=NONE
hi Constant     ctermfg=1  ctermbg=NONE cterm=NONE
hi String       ctermfg=2  ctermbg=NONE cterm=NONE
hi Character    ctermfg=2  ctermbg=NONE cterm=NONE
hi Number       ctermfg=5  ctermbg=NONE cterm=NONE
hi Boolean      ctermfg=5  ctermbg=NONE cterm=NONE
hi Float        ctermfg=5  ctermbg=NONE cterm=NONE

hi Identifier   ctermfg=6  ctermbg=NONE cterm=NONE
hi Function     ctermfg=11 ctermbg=NONE cterm=NONE

hi Statement    ctermfg=3  ctermbg=NONE cterm=NONE
hi Conditional  ctermfg=3  ctermbg=NONE cterm=NONE
hi Repeat       ctermfg=3  ctermbg=NONE cterm=NONE
hi Label        ctermfg=3  ctermbg=NONE cterm=NONE
hi Operator     ctermfg=7  ctermbg=NONE cterm=NONE
hi Keyword      ctermfg=3  ctermbg=NONE cterm=NONE
hi Exception    ctermfg=1  ctermbg=NONE cterm=NONE

hi PreProc      ctermfg=5  ctermbg=NONE cterm=NONE
hi Include      ctermfg=5  ctermbg=NONE cterm=NONE
hi Define       ctermfg=5  ctermbg=NONE cterm=NONE
hi Macro        ctermfg=5  ctermbg=NONE cterm=NONE
hi PreCondit    ctermfg=5  ctermbg=NONE cterm=NONE

hi Type         ctermfg=4  ctermbg=NONE cterm=NONE
hi StorageClass ctermfg=4  ctermbg=NONE cterm=NONE
hi Structure    ctermfg=4  ctermbg=NONE cterm=NONE
hi Typedef      ctermfg=4  ctermbg=NONE cterm=NONE

hi Special      ctermfg=6  ctermbg=NONE cterm=NONE
hi SpecialChar  ctermfg=6  ctermbg=NONE cterm=NONE
hi Tag          ctermfg=5  ctermbg=NONE cterm=NONE
hi Delimiter    ctermfg=5  ctermbg=NONE cterm=NONE
hi SpecialComment ctermfg=8 ctermbg=NONE cterm=italic
hi Debug        ctermfg=1  ctermbg=NONE cterm=NONE

hi Underlined   ctermfg=6  ctermbg=NONE cterm=underline
hi Ignore       ctermfg=8  ctermbg=NONE cterm=NONE
hi Error        ctermfg=15 ctermbg=1    cterm=NONE
hi Todo         ctermfg=0  ctermbg=11   cterm=bold

" Directory listings
hi Directory    ctermfg=4  ctermbg=NONE cterm=NONE

" Special cases
hi Title        ctermfg=11 ctermbg=NONE cterm=bold
hi Conceal      ctermfg=8  ctermbg=NONE cterm=NONE

" Links to reduce redundancy
hi link Float Number
hi link SpecialKey NonText
hi link IncSearch Search
hi link CursorIM Cursor
hi link VisualNOS Visual

" JSX/TSX bracket colors
hi jsxOpenPunct     ctermfg=5  ctermbg=NONE cterm=NONE
hi jsxClosePunct    ctermfg=5  ctermbg=NONE cterm=NONE
hi jsxPunct         ctermfg=5  ctermbg=NONE cterm=NONE
hi jsxCloseString   ctermfg=5  ctermbg=NONE cterm=NONE
