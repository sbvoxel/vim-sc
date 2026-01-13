function! SetFileTypeScope()
  " Avoid setfiletype because other ftdetects may claim *.sc (e.g. Scala/Ammonite).
  if &filetype != 'scope'
    set filetype=scope
  endif
endfunction

au BufRead,BufNewFile *.sc call SetFileTypeScope()
au BufRead,BufNewFile *.sc2 call SetFileTypeScope()
au BufRead,BufNewFile *.sci call SetFileTypeScope()
au BufRead,BufNewFile scope.conf call SetFileTypeScope()
