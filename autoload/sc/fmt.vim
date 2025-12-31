" Adapted from ziglang/zig.vim (MIT)
"
" Adapted from fatih/vim-go: autoload/go/fmt.vim
"
" Copyright 2011 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.

function! sc#fmt#Format() abort
  " Save cursor position and many other things.
  let view = winsaveview()

  if !executable('scopefmt')
    echohl Error | echomsg "no scopefmt binary found in PATH" | echohl None
    return
  endif

  let cmdline = 'scopefmt' " TODO: Here pass in --stdin so that we can have the option of files instead
  let current_buf = bufnr('')

  " The formatted code is output on stdout, the errors go on stderr.
  silent let out = systemlist(cmdline, current_buf)
  let err = v:shell_error

  if err == 0
    " remove undo point caused via BufWritePre.
    try | silent undojoin | catch | endtry

    " Replace the file content with the formatted version.

    " 1) Insert new lines from the top
    call setline(1, out)

    " 2) Delete leftover lines if new file is shorter
    if line('$') > len(out)
      call deletebufline(current_buf, len(out) + 1, line('$'))
    endif

    " No errors detected, close the loclist.
    call setloclist(0, [], 'r')
    lclose
  elseif get(g:, 'sc_fmt_parse_errors', 1)
    let errors = s:parse_errors(expand('%'), out)

    call setloclist(0, [], 'r', {
        \ 'title': 'Errors',
        \ 'items': errors,
        \ })

    let max_win_height = get(g:, 'sc_fmt_max_window_height', 5)
    " Prevent the loclist from becoming too long.
    let win_height = min([max_win_height, len(errors)])
    " Open the loclist, but only if there's at least one error to show.
    execute 'silent! lwindow ' . win_height
  endif

  call winrestview(view)

  if err != 0
    echohl Error | echomsg "scopefmt returned error" | echohl None
    return
  endif

  " Run the syntax highlighter on the updated content and recompute the folds if
  " needed.
  syntax sync fromstart
endfunction

" parse_errors parses the given errors and returns a list of parsed errors
function! s:parse_errors(filename, lines) abort
  " list of errors to be put into location list
  let errors = []
  for line in a:lines
    let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
    if !empty(tokens)
      call add(errors,{
            \"filename": a:filename,
            \"lnum":     tokens[2],
            \"col":      tokens[3],
            \"text":     tokens[4],
            \ })
    endif
  endfor

  return errors
endfunction
" vim: sw=2 ts=2 et
