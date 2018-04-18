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
nmap <F4> :TagbarToggle<cr>
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
let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSearchTiming = 300
let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp|target|target-server-side|node_modules|webapp\/lib)[\/]'
let g:airline_exclude_preview = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-Tab>'
let g:ycm_extra_conf_globlist = ['~/*egui_final/*', '~/fun/cmus/*']
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:fugitive_gitlab_domains = ['https://scm.hue.workslan', 'http://product-ci']
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimTempFilesEnable = 1
let g:EclimLoggingDisabled = 1

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
function! HighlightCursor()
  silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
endfunction
function! ToggleCursorHighlighter()
  if g:cursorHighlighterEnabled == 1
    let g:cursorHighlighterEnabled = 0
    autocmd! CursorHighlighter
  else
    let g:cursorHighlighterEnabled = 1
    autocmd CursorHighlighter CursorMoved * call HighlightCursor()
    call HighlightCursor()
  endif
endfunction
nnoremap <F2> :call HighlightCursor()<CR>
nnoremap <leader><F2> :call ToggleCursorHighlighter()<CR>

" Redmine/file name shortcuts
function! OpenRedmineIssue()
  if !empty(matchstr(expand("<cword>"), "^[[:digit:]]*$"))
    exec "!open-redmine " . expand("<cword>")
  endif
endfunction
nnoremap <leader>r :call OpenRedmineIssue()<CR>
nnoremap <leader>ifn i<C-R>=expand("%:t:r")<CR><ESC>
nnoremap <leader>afn a<C-R>=expand("%:t:r")<CR><ESC>

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

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

colorscheme Tomorrow-Night



function! DeleteInactiveBufs()
  "From tabpagebuflist() help, get a list of all buffers in all tabs
  let tablist = []
  for i in range(tabpagenr('$'))
    call extend(tablist, tabpagebuflist(i + 1))
  endfor

  "Below originally inspired by Hara Krishna Dara and Keith Roberts
  "http://tech.groups.yahoo.com/group/vim/message/56425
  let nWipeouts = 0
  for i in range(1, bufnr('$'))
    if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
      "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
      silent exec 'bwipeout' i
      let nWipeouts = nWipeouts + 1
    endif
  endfor
  echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()

command! Tblame :exec "!tig blame +" . line('.') . " " . expand('%')

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

"augroup autoformat_settings
"  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"  autocmd FileType html,css,json AutoFormatBuffer js-beautify
"  autocmd FileType java AutoFormatBuffer google-java-format
"augroup END

call glaive#Install()
