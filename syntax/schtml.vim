" Vim syntax file

runtime! syntax/html.vim
runtime! syntax/sc.vim

syntax match schtmlKeyword /@\ze\w\+/
syntax match schtmlKeyword /@model\|@render_page\|@render_body\|@layout\|@use/
hi def link schtmlKeyword Keyword
