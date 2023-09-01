if exists("g:sc_loaded")
  finish
endif
let g:sc_loaded = 1

function! s:fmt_autosave()
  if get(g:, "sc_fmt_autosave", 1)
    call sc#fmt#Format()
  endif
endfunction

augroup vim-sc
  autocmd!
  autocmd BufWritePre *.sc call s:fmt_autosave()
augroup end

" vim: sw=2 ts=2 et
