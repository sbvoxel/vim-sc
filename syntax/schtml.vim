" Vim syntax file
" This is clearly adapted (incompletely) from Zig

runtime! syntax/html.vim
runtime! syntax/sc.vim

syntax match schtmlKeyword /@\ze\w\+/
syntax match schtmlKeyword /@model\|@render_page\|@render_body\|@layout\|@use/
hi def link schtmlKeyword Keyword
