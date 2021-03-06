" Open definition of function under cursor
function! JSOpenDefExternal()
  exec "Ggrep '\\." . expand("<cword>") . " = \\(.*(\\)\\?function' '*.js' | cw"
endfunction
function! JSOpenDef()
  let l:searchString = "\\." . expand("<cword>") . " = \\(.*(\\)\\?function"
  if search(l:searchString, "s") == 0
    call JSOpenDefExternal()
  else
    let @/ = l:searchString
  endif
endfunction
function! JSGrepF()
  exec "!jsgrepf -w " . expand("<cword>")
endfunction

nnoremap <buffer> <leader>d :call JSOpenDef()<CR>
nnoremap <buffer> <leader>D :call JSOpenDefExternal()<CR>
nnoremap <buffer> <leader>f :call JSGrepF()<CR>

let b:ale_fixers = ['prettier']
let g:ale_fix_on_save = 1
