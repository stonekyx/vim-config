if !exists("*NewJavaTest")
    function! NewJavaTest()
        try
            edit %:rTest.java
        finally
        endtry
    endfunction

    command! EditTest call NewJavaTest()
endif
command! RunJavaTest execute "!java -cp .:/usr/share/java/junit.jar org.junit.runner.JUnitCore %:r"
command! RunJava execute "!java -cp . %:r"

if !exists("*BackFromJavaTest")
    function! BackFromJavaTest()
        try
            let filename = expand("%")
            if strpart(filename, strlen(filename)-strlen("Test.java"), strlen(filename))=="Test.java"
                execute 'edit ' . join([strpart(filename, 0, strlen(filename)-strlen("Test.java")),".java"], '')
            endif
        finally
        endtry
    endfunction

    command! EditOriginal call BackFromJavaTest()
endif

map <buffer> <F5> :EditTest<CR>
map <buffer> <F6> :RunJava<CR>
map <buffer> <F7> :RunJavaTest<CR>
map <buffer> <F8> :make<CR>
map <buffer> <F9> :EditOriginal<CR>
nnoremap <buffer> <leader>d :JavaSearchContext<CR>
nnoremap <buffer> <leader>h :JavaDocPreview<CR>

if !exists("JUnitAutocmdLoaded")
    autocmd BufNewFile *Test.java silent! 0r $HOME/.vim/skeleton.junit
    let JUnitAutocmdLoaded = 1
endif

"setlocal tabstop=4
"setlocal softtabstop=4
"setlocal shiftwidth=4
setlocal cinoptions=j1,(2s,+2s,:0
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

augroup autoformat_settings
  autocmd FileType java AutoFormatBuffer google-java-format
augroup END
