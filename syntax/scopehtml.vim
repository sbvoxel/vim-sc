" Vim syntax file

runtime! syntax/html.vim
runtime! syntax/scope.vim

syntax match scopehtmlKeyword /@\ze\w\+/
syntax match scopehtmlKeyword /@model\|@render_page\|@render_body\|@layout\|@use/
hi def link scopehtmlKeyword Keyword
