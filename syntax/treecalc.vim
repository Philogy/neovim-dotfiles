if exists("b:current_syntax")
  finish
endif

scriptencoding utf-8
syntax case match

" -----------------------------
" Comments
" -----------------------------
syn match treelangComment "//.*$"

" -----------------------------
" Keywords / directives
" -----------------------------
syn keyword treelangKeyword    fn
syn match   treelangDirective  /#num\|#show\|#viz/

" -----------------------------
" Operators / punctuation / special
" -----------------------------
syn match treelangOperator  /->/
syn match treelangOperator  /=/
syn match treelangDelimiter /[()]/
syn match treelangLeaf      /[△$]/

" -----------------------------
" Identifiers
" -----------------------------
" Identifiers are [A-Za-z0-9_]+ (can start with a digit per lexer)
" Keep it broad and let specific groups above win on priority.
syn match treelangIdentifier /\<[A-Za-z0-9_]\+\>/

" -----------------------------
" Default links
" -----------------------------
hi def link treelangComment     Comment
hi def link treelangKeyword     Keyword
hi def link treelangDirective   PreProc
hi def link treelangOperator    Operator
hi def link treelangDelimiter   Delimiter
hi def link treelangLeaf        Constant
hi def link treelangIdentifier  Identifier

" -----------------------------
" Misc buffer-local settings
" -----------------------------
setlocal commentstring=//\ %s
setlocal iskeyword+=48-57,95     " include 0-9 and _ as identifier chars

let b:current_syntax = "treelang"
