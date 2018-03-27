" Open definition of function under cursor
function! JSOpenDefExternal()
  exec "Ggrep '\." . expand("<cword>") . " = function' '*.js' | cw"
endfunction
function! JSOpenDef()
  let l:searchString = "\." . expand("<cword>") . " = function"
  if search(l:searchString, "s") == 0
    call JSOpenDefExternal()
  else
    let @/ = l:searchString
  endif
endfunction
function! JSGrepF()
  exec "!jsgrepf -w " . expand("<cword>")
endfunction

nnoremap <leader>d :call JSOpenDef()<CR>
nnoremap <leader>D :call JSOpenDefExternal()<CR>
nnoremap <leader>f :call JSGrepF()<CR>
