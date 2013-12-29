syntax enable
filetype indent on
filetype plugin on
set number
set showcmd
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nohlsearch
set autoindent
set cindent
set backspace=indent,eol,start
colorscheme railscasts2
set background=dark
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
nnoremap <F3> :set hlsearch!<CR>
map <F4> :TlistToggle<cr>
python from powerline.ext.vim import source_plugin; source_plugin()
set laststatus=2
set scrolloff=9999
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

if filereadable(".vim.custom")
    so .vim.custom
endif

function! NewFile()
    silent! 0r $HOME/.vim/skeleton.%:e
    silent! s/FILENAME/\=expand("%:t:r")
endfunction

autocmd BufNewFile * call NewFile()

call pathogen#infect()
let g:vim_markdown_folding_disabled=1

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
