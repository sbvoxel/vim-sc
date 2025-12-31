if (exists("b:did_ftplugin"))
    finish
endif

let b:did_ftplugin = 1

let b:undo_ftplugin =
    \ 'setl isk< et< ts< sts< sw< fo< sua< mp< com< cms< inex< inc< pa<'

augroup vim-scope
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> if get(g:, 'scope_fmt_autosave', 1) | call scope#fmt#Format() | endif
augroup END

let b:undo_ftplugin .= '|au! vim-scope * <buffer>'

set expandtab
set tabstop=4
set shiftwidth=4

setlocal suffixesadd=.sc
setlocal commentstring=//\ %s
