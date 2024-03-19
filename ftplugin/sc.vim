if (exists("d:did_ftplugin"))
    finish
endif

let b:did_ftplugin = 1

let b:undo_ftplugin =
    \ 'setl isk< et< ts< sts< sw< fo< sua< mp< com< cms< inex< inc< pa<'

augroup vim-sc
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> if get(g:, 'sc_fmt_autosave', 1) | call sc#fmt#Format() | endif
augroup END

let b:undo_ftplugin .= '|au! vim-sc * <buffer>'

set expandtab
set tabstop=4
set shiftwidth=4

setlocal suffixesadd=.sc
setlocal commentstring=//\ %s
