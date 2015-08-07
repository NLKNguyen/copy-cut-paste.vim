" Paste in INSERT mode {{{
"=============================================================
" Pasting From System Clipboard Without Having To Do This:
" set pastetoggle=<F2>
"=============================================================
function! s:WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= s:WrapForTmux("\<Esc>[?2004h")
let &t_EI .= s:WrapForTmux("\<Esc>[?2004l")

function! s:XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ <SID>XTermPasteBegin()
" }}}

"Copy a whole line to clipboard
nnoremap QC "+Y

"Copy selected text to clipboard
vnoremap QC "+y
vnoremap Qc "+y


"Cut a whole line to clipboard
nnoremap QX "+Y dd

"Cut selected text to clipboard
vnoremap QX "+y gvd
vnoremap Qx "+y gvd


"Paste from clipboard
nnoremap QV "+P
nnoremap Qv "+p

" vim: foldmethod=marker
