" Vim defaults to giving '.sc' files the scala filetype.
"
" We used to correct this with 'set filetype=sc' but we're
" trying to learn from the zig project which has switched to
" using 'setfiletype' to prevent re-setting the filetype and
" thus firing all FileType autocommands again.
"
" Using 'setfiletype' doesn't work for us because unlike for '.zig',
" Vim already has a filetype (scala) for '.sc' which we must overwrite.
"
" Here we're trying to replicate setfiletype but while still overwriting
" the default scala filetype. I don't have time to figure out the best
" approach at the moment but this seems fine.

function! SetFileTypeSC()
  if &filetype != 'sc'
    set filetype=sc
  endif
endfunction

au BufRead,BufNewFile *.sc call SetFileTypeSC()
au BufRead,BufNewFile *.sc2 call SetFileTypeSC()
au BufRead,BufNewFile *.sci call SetFileTypeSC()
au BufRead,BufNewFile sc_config.txt call SetFileTypeSC()
