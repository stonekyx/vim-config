syntax enable
filetype indent on
filetype plugin on
set number
set showcmd
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set autoindent
set cindent
set hidden
set backspace=indent,eol,start
set background=dark
set textwidth=120
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
nnoremap <F3> :set hlsearch!<CR>
map <F4> :TlistToggle<cr>
"python from powerline.ext.vim import source_plugin; source_plugin()
set laststatus=2
set scrolloff=9999

"Access X11 and <C-V> clipboard
set clipboard=unnamed,unnamedplus

set exrc
set secure

function! NewFile()
    silent! 0r $HOME/.vim/skeleton.%:e
    silent! s/FILENAME/\=expand("%:t:r")
endfunction

autocmd BufNewFile * call NewFile()

let g:pathogen_disabled = []
if !has('gui_running')
"    call add(g:pathogen_disabled, 'youcompleteme')
endif

call pathogen#infect()
let g:vim_markdown_folding_disabled=1
"colorscheme solarized
"let g:solarized_contrast="high"
let g:CtrlSpaceDefaultMappingKey = "<C-a>"
let g:airline_exclude_preview = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

autocmd FileType c let &makeprg='gcc -g -Wall -lm -o %:r %'
autocmd FileType cpp let &makeprg='g++ -g -Wall -Wextra -std=c++0x % -o %:r'
autocmd FileType haskell let &makeprg='ghc %'
autocmd FileType java let &makeprg='javac -cp .:/usr/share/java/junit-4.11.jar %'
autocmd FileType pascal let &makeprg='fpc -g %'
autocmd FileType python let &makeprg='python2 %'
autocmd FileType plaintex let &makeprg='pdflatex % && xpdf %:r.pdf &>/dev/null'

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
  set t_Co=256
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

" Highlight word under cursor
augroup CursorHighlighter
let g:cursorHighlighterEnabled = 0
function! ToggleCursorHighlighter()
  if g:cursorHighlighterEnabled == 1
    let g:cursorHighlighterEnabled = 0
    autocmd! CursorHighlighter
  else
    let g:cursorHighlighterEnabled = 1
    autocmd CursorHighlighter CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
  endif
endfunction
nnoremap <F2> :call ToggleCursorHighlighter()<CR>

" Open definition of function under cursor
function! JSOpenDefExternal()
  exec "!opendef " . "." . expand("<cword>")
endfunction
function! JSOpenDef()
  let l:searchString = "\." . expand("<cword>") . " = function"
  if search(l:searchString, "s") == 0
    call JSOpenDefExternal()
  else
    let @/ = l:searchString
  endif
endfunction
nnoremap <leader>d :call JSOpenDef()<CR>
nnoremap <leader>D :call JSOpenDefExternal()<CR>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

map <Leader> <Plug>(easymotion-prefix)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Gif config
map  <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  <Leader>n <Plug>(easymotion-next)
map  <Leader>N <Plug>(easymotion-prev)

colorscheme solarized
