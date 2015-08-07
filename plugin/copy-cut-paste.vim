" Plugin: copy-cut-paste.vim
" Description: Keymaps to naturally copy, cut, and paste between
"              Vim buffer and system clipboard.
" Author: Nguyen Nguyen
" Origin: https://github.com/NLKNguyen/copy-cut-paste.vim
" License: same as Vim

" NORMAL And VISUAL Mapping: {{{
nnoremap <Plug>CCP_CopyLine "+Y
vnoremap <Plug>CCP_CopyText "+y

nnoremap <Plug>CCP_CutLine "+Y dd
vnoremap <Plug>CCP_CutText "+y gvd

nnoremap <Plug>CCP_PasteText "+p

if !exists("g:copy_cut_paste_no_mappings") || ! g:copy_cut_paste_no_mappings
  "Copy a whole line to clipboard
  nmap QC <Plug>CCP_CopyLine

  "Copy selected text to clipboard
  vmap QC <Plug>CCP_CopyText


  "Cut a whole line to clipboard
  nmap QX <Plug>CCP_CutLine

  "Cut selected text to clipboard
  vmap QX <Plug>CCP_CutText


  "Paste from clipboard
  nmap QV <Plug>CCP_PasteText
endif
" }}}

" INSERT Mapping: {{{
" Stole somewhere on StackOverflow but can't find the source again to give credit
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

" vim: foldmethod=marker
