" Vim syntax file
" Language:     Kaj
" Maintainer:   Jak Wings <https://github.com/jakwings/Kaj-Markup-Language>
" Last Change:  2014-09-01T12:00:30+0800

if exists("b:current_syntax")
  finish
endif

syntax case match

syntax cluster kajSpan contains=kajSpanBold,kajSpanItalic,kajSpanBoldItalic,kajSpanCode,kajSpanKey,kajSpanLiteral,kajSpanRaw,kajSpanRole,kajSpanAnchor,kajSpanNote,kajSpanLink,kajSpanPipe
syntax region kajSpanBold matchgroup=kajSpanParens start="{\*\(\*}\)\@!" end="\*}" oneline contained
syntax region kajSpanItalic matchgroup=kajSpanParens start="{/\(/}\)\@!" end="/}" oneline contained
syntax region kajSpanBoldItalic matchgroup=kajSpanParens start="{%\(%}\)\@!" end="%}" oneline contained
syntax region kajSpanCode matchgroup=kajSpanParens start="{`\(`}\)\@!" end="`}" oneline contained
syntax region kajSpanKey matchgroup=kajSpanParens start="{:\(:}\)\@!" end=":}" oneline contained
syntax region kajSpanLiteral matchgroup=kajSpanParens start="``\(``\)\@!" end="``" oneline contained
syntax region kajSpanRaw matchgroup=kajSpanParens start="{{\(}}\)\@!" end="}}" oneline contained
syntax region kajSpanAnchor matchgroup=kajSpanParens start="{#\(#}\)\@!" end="#}" oneline contained
syntax region kajSpanPipe matchgroup=kajSpanParens start="{|\(|}\)\@!" end="|}" oneline contained
syntax region kajSpanRole matchgroup=kajSpanParens start="{\~\(\~}\)\@!" end="\~}" oneline contained
syntax region kajSpanLink matchgroup=kajSpanParens start="\[\[\(\]\]\)\@!" end="\]\]" oneline contained

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
highlight def link kajSpanPipe Tag
highlight def link kajSpanRole Type
highlight def link kajSpanLink Underlined

syntax match kajBlockParagraph "\S.*$" contains=@kajSpan
syntax match kajBlockOneliner "\~/ .*$"
syntax match kajBlockCode "\~//.*$"
syntax match kajBlockSection "^=\+ .*$"
syntax match kajBlockComment "\.\. .*$"
syntax match kajBlockDirectiveStart "\.\. \S\+{" nextgroup=kajBlockDirectiveArg
syntax match kajBlockDirectiveArg "[^{}]*" contained nextgroup=kajBlockDirectiveEnd
syntax match kajBlockDirectiveEnd "}.*$" contained

highlight def link kajBlockSection Statement
highlight def link kajBlockCode Typedef
highlight def link kajBlockOneliner String
highlight def link kajBlockComment Comment
highlight def link kajBlockDirectiveStart Macro
highlight def link kajBlockDirectiveEnd Macro
highlight def link kajBlockDirectiveArg Identifier

let b:current_syntax = "kaj"