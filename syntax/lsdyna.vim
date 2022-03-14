" Vim syntax file
" Language:     LS-DYNA Keyword Files
" Maintainer:   Yuki
" Email:        none
" Last Change:  2020-01-17
" Version:      1

if exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=:
syn case ignore

syn region keyword start=/^\*/ end=/$/
syn region parameter start=/&/ end=/[A-Za-z_0-9\-;:]*/
"syn region parameter start=/&/ end=/[^ ]*/
syn region comment start=/^\$/ end=/$/
syn region comment_block start=/^\*COMMENT \*/ end=/\n\%(\*\)\@=/
"syn region comment_block start=/\(^\*COMMENT \*\)\@<=/ end=/\n\%(\*\)\@=/

highlight link keyword   String
highlight link parameter   Special
"highlight link keyword   Keyword
highlight link comment   Comment
highlight link comment_block   Comment

let b:current_syntax = "lsdyna"
