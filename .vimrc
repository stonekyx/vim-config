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
set background=dark
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
nnoremap <F3> :set hlsearch!<CR>
map <F4> :TlistToggle<cr>
"python from powerline.ext.vim import source_plugin; source_plugin()
set laststatus=2
set scrolloff=9999
colorscheme Tomorrow-Night

"Access X11 and <C-V> clipboard
set clipboard=unnamed,unnamedplus

if filereadable(".vim.custom")
    so .vim.custom
endif

function! NewFile()
    silent! 0r $HOME/.vim/skeleton.%:e
    silent! s/FILENAME/\=expand("%:t:r")
endfunction

autocmd BufNewFile * call NewFile()

let g:pathogen_disabled = []
if !has('gui_running')
    call add(g:pathogen_disabled, 'youcompleteme')
endif

call pathogen#infect()
let g:vim_markdown_folding_disabled=1
"colorscheme solarized
"let g:solarized_contrast="high"
let g:ctrlspace_default_mapping_key="<C-a>"
let g:airline_exclude_preview = 1
let g:airline#extensions#branch#enabled = 1
