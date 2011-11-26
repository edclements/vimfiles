" Vim color file
"
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
"    NR-16   NR-8    COLOR NAME ~
"    0	    0	    Black
"    1	    4	    DarkBlue
"    2	    2	    DarkGreen
"    3	    6	    DarkCyan
"    4	    1	    DarkRed
"    5	    5	    DarkMagenta
"    6	    3	    Brown, DarkYellow
"    7	    7	    LightGray, LightGrey, Gray, Grey
"    8	    0*	    DarkGray, DarkGrey
"    9	    4*	    Blue, LightBlue
"    10	    2*	    Green, LightGreen
"    11	    6*	    Cyan, LightCyan
"    12	    1*	    Red, LightRed
"    13	    5*	    Magenta, LightMagenta
"    14	    3*	    Yellow, LightYellow
"    15	    7*	    White

set background=light

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="edcolour16"

hi Normal gui=None guifg=Black guibg=LightGrey cterm=None ctermfg=Black ctermbg=LightGrey

" highlight groups
hi Cursor guibg=DarkGrey guifg=Green ctermbg=DarkGrey ctermfg=Green
"hi CursorIM	
"hi Directory	
"hi DiffAdd				
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
"hi Folded	guibg=grey30 guifg=gold 
"hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch gui=None guibg=DarkGrey cterm=None ctermbg=DarkGrey
hi LineNr gui=None guifg=DarkYellow cterm=None ctermfg=DarkYellow
"hi ModeMsg	guifg=goldenrod
"hi MoreMsg	guifg=SeaGreen
"hi NonText	guifg=LightBlue guibg=grey30
"hi Question	guifg=springgreen
"hi Search	guibg=peru guifg=wheat
"hi SpecialKey	guifg=yellowgreen
"hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
"hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
"hi Title	guifg=indianred
hi Visual gui=None guibg=Magenta cterm=None ctermbg=Magenta
"hi VisualNOS	
"hi WarningMsg	guifg=salmon
"hi WildMenu	
"hi Menu				
"hi Scrollbar	
"hi Tooltip				

" syntax highlighting groups
hi Comment gui=None guifg=DarkGreen cterm=None ctermfg=DarkGreen

hi Constant gui=None guifg=DarkMagenta cterm=None ctermfg=DarkMagenta
"hi String
"hi Character
"hi Number
"hi Boolean
"hi Float

hi Identifier gui=None guifg=DarkBlue cterm=None ctermfg=DarkBlue
"hi Function

hi Statement gui=None guifg=DarkCyan cterm=None ctermfg=DarkCyan
"hi Conditional
"hi Repeat
"hi Label
"hi Operator
"hi Keyword
"hi Exception

hi PreProc gui=None guifg=DarkRed cterm=None ctermfg=DarkRed
"hi Include
"hi Define
"hi Macro
"hi PreCondit

hi Type gui=None guifg=DarkYellow cterm=None ctermfg=DarkYellow
"hi StorageClass
"hi Structure
"hi TypeDef

hi Special gui=None guifg=DarkYellow cterm=None ctermfg=DarkYellow
"hi SpecialChar
"hi Tag
"hi Delimiter
"hi SpecialComment
"hi Debug
"
hi Underlined gui=Underline cterm=Underline
hi Ignore gui=None guifg=Grey cterm=None ctermfg=Grey
hi Error gui=None guifg=White guibg=Red cterm=None ctermfg=White ctermbg=Red
hi Todo gui=None guifg=DarkRed guibg=Yellow cterm=None ctermfg=DarkRed ctermbg=Yellow

