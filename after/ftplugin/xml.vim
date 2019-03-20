if expand("%:e")=="ts"
    let filename = expand("%")
    if strpart(filename, strlen(filename)-strlen(".check.ts"), strlen(filename))==".check.ts"
        let origin = strpart(filename, 0, strlen(filename)-strlen(".check.ts"))
        let &makeprg="checkmk % > %:r.c; gcc -g -Wall `pkg-config --libs --cflags check` " . origin . ".c %:r.c -o %:r; ./%:r"
    endif
endif

EmmetInstall
