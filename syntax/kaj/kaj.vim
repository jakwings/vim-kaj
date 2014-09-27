" Vim syntax file
" Language:     Kaj
" Maintainer:   Jak Wings <https://github.com/jakwings/Kaj-Markup-Language>
" Last Change:  2014-09-01T12:00:30+0800

if exists("b:current_syntax")
  finish
endif

"set concealcursor="nc"
"set conceallevel=2

syntax case match

syntax cluster kajSpan contains=kajSpanBold,kajSpanItalic,kajSpanBoldItalic,kajSpanCode,kajSpanKey,kajSpanLiteral,kajSpanRaw,kajSpanRole,kajSpanAnchor,kajSpanNote,kajSpanLink,kajSpanPipe,kajInvalidSpan
syntax region kajInvalidSpan matchgroup=kajIncompleteMarker start="\({\*\|{/\|{%\|{`\|{:\|{{\|{|\|{#\|{\~\|``\|\[\[\)" end="$" oneline contained
syntax region kajSpanBold matchgroup=kajSpanParens start="{\*\(\*}\)\@!" end="\*}" oneline contained concealends
syntax region kajSpanItalic matchgroup=kajSpanParens start="{/\(/}\)\@!" end="/}" oneline contained concealends
syntax region kajSpanBoldItalic matchgroup=kajSpanParens start="{%\(%}\)\@!" end="%}" oneline contained concealends
syntax region kajSpanNote matchgroup=kajSpanParens start="{\[\(\]}\)\@!" end="\]}" oneline contained
syntax region kajSpanCode matchgroup=kajSpanParens start="{`\(`}\)\@!" end="`}" oneline contained concealends
syntax region kajSpanKey matchgroup=kajSpanParens start="{:\(:}\)\@!" end=":}" oneline contained
syntax region kajSpanLiteral matchgroup=kajSpanParens start="``\(``\)\@!" end="``" oneline contained concealends
syntax region kajSpanRaw matchgroup=kajSpanParens start="{{\(}}\)\@!" end="}}" oneline contained
syntax region kajSpanAnchor matchgroup=kajSpanParens start="{#\(#}\)\@!" end="#}" oneline contained
syntax region kajSpanPipe matchgroup=kajSpanParens start="{|\(|}\)\@!" end="|}" oneline contained
syntax region kajSpanRole matchgroup=kajSpanParens start="{\~\(\~}\)\@!" end="\~}" oneline contained concealends
syntax region kajSpanLink matchgroup=kajSpanParens start="\[\[\(\]\]\)\@!" end="\]\]" oneline contained concealends

highlight def kajFormatBold term=bold cterm=bold gui=bold
highlight def kajFormatItalic term=italic cterm=italic gui=italic
highlight def kajFormatBoldItalic term=bold,italic cterm=bold,italic gui=bold,italic
highlight def kajFormatStandout term=standout cterm=standout gui=standout
highlight def link kajSpanParens Comment
highlight def link kajSpanBold kajFormatBold
highlight def link kajSpanItalic kajFormatItalic
highlight def link kajSpanBoldItalic kajFormatBoldItalic
highlight def link kajSpanCode Statement
highlight def link kajSpanKey Character
highlight def link kajSpanLiteral String
highlight def link kajSpanRaw Comment
highlight def link kajSpanAnchor SpecialComment
highlight def link kajSpanNote SpecialComment
highlight def link kajSpanPipe Identifier
highlight def link kajSpanRole Type
highlight def link kajSpanLink Underlined
highlight def link kajInvalidSpan Statement
highlight def link kajIncompleteMarker Error

syntax cluster kajBlock contains=kajBlockParagraph,kajBlockOneliner,kajBlockCode,kajBlockSection,kajBlockComment,kajBlockDirectiveStart,kajBlockLine,kajBlockIndented
syntax match kajBlockParagraph "[^ \t].*$" contains=@kajSpan transparent
syntax match kajBlockOneliner "\~/ .*$"
syntax match kajBlockCode "\~//.*$"
syntax match kajBlockSection "^=\+ .*$"
syntax match kajBlockComment "\.\. .*$"
syntax match kajBlockDirectiveStart "\.\. [^ \t]\+{" nextgroup=kajBlockDirectiveArg
syntax match kajBlockDirectiveArg "[^{}]*" contained nextgroup=kajBlockDirectiveEnd
syntax match kajBlockDirectiveEnd "}.*$" contained
syntax match kajBlockLine "|\( \|[ \t]*\_$\)"he=s+1 nextgroup=kajBlockLine skipwhite skipempty contains=@kajSpan

highlight def link kajBlockSection Statement
highlight def link kajBlockLine Comment
highlight def link kajBlockCode Typedef
highlight def link kajBlockOneliner String
highlight def link kajBlockComment Comment
highlight def link kajBlockDirectiveStart Macro
highlight def link kajBlockDirectiveEnd Macro
highlight def link kajBlockDirectiveArg Identifier
"highlight def link kajBlockIndented Comment

let b:current_syntax = "kaj"