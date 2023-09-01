if (exists("d:did_ftplugin"))
    finish
endif

let b:did_ftplugin = 1

set expandtab
set tabstop=4
set shiftwidth=4

setlocal suffixesadd=.sc
setlocal commentstring=//\ %s
