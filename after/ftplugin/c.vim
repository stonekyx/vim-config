set makeprg=gcc\ -g\ -Wall\ -lm\ -o\ %:r\ %

if !exists("*DoSplitHeader")
    function! DoSplitHeader(suffix)
        try
            let filename = expand("%:r")
            execute 'vs ' . join([filename, a:suffix], '')
        finally
        endtry
    endfunction

    command! SplitHeader call DoSplitHeader('.h')
    command! SplitSource call DoSplitHeader('.c')
endif

map <F5> :SplitHeader<CR>
map <F6> :SplitSource<CR>
