""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'bakpakin/fennel.vim'
Plug 'fedreg/deeper-blue.vim'
Plug 'fedreg/tsdh-dark.vim'
Plug 'bluz71/vim-moonfly-statusline'
Plug 'guns/vim-sexp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Olical/conjure'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-vinegar'

call plug#end()

" """"""""""""""""""""""""""""""""""""""""""""""""""
" BASICS 
" """"""""""""""""""""""""""""""""""""""""""""""""""
" Don't worry about compatibility with VI
set nocompatible

" Create <FILENAME>.un~files whenever you edit a file.
" This lets you used UNDO even after you close and reoen a file.
set undofile
set noswapfile

" Don't show omnicomplete scratch window
set completeopt-=preview

" Leader
let mapleader = " "
let maplocalleader = ","

" 2 space indent
set shiftwidth=2

" Autosave on loss of focus
autocmd BufLeave,FocusLost * silent! wall

" Case insensitive if lowercase search; sensitive if upper...
set ignorecase smartcase

" Don't need /g in searches
set gdefault

" It's... complicated..  see :help 'hidden'
set hidden

" Auto save if not typing for 5 secs
set updatetime=5000

" Make linux clipboard more like Mac, single
set clipboard=unnamedplus

set foldmethod=manual

" Start with folds open.  zC closes all; zR opens all
set nofoldenable

" Highlight the words you're going to replace
set inccommand=split

" Clean Whitespace from file ith SPACE W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" No Highlight remains after search
nnoremap <CR> :noh<CR><CR>

" quickly edit this file
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :w<cr> :source $MYVIMRC<cr>
:nnoremap <leader>sf :w<cr> :source %<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme
syntax enable
set background=dark
set termguicolors
colorscheme tsdh-dark
" colorscheme deeper-blue
" highlight nontext ctermbg=000000
au VimEnter * RainbowParentheses
" Show matching brackets
set showmatch
" Don't show -- INSERT -- under status line
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_auto_start = 0
let g:markdown_folding = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Conjure
""""""""""""""""""""""""""""""""""""""""""""""""""
highlight NormalFloat ctermbg=000000

let g:conjure#client#clojure#nrepl#action#out_subscribe = v:true
let g:conjure#client#clojure#nrepl#eval#raw_out = v:true 
let g:conjure#log#wrap = v:true 

""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign
""""""""""""""""""""""""""""""""""""""""""""""""""
" visual mode
xmap ga <Plug>(EasyAlign)
" motion mode
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use JK instead of ESC
inoremap jk <Esc>

" Use ESC to exit neovim terminal
tnoremap jk <C-\><C-n>

" Navigation
noremap <C-k> <C-w><Up>
noremap <C-j> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

" Use TAB to jump to matching brace (like %)
noremap <tab> %

" Last visited buffer
noremap <Leader>l <C-^>

" Find last accessed buffer for TAB completion
set wildmode=full:lastused

nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :Buffers<CR>

" Jump back from jump-list
noremap <LocalLeader>gb <C-o>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Tab for autocomplete in insert mode
inoremap <TAB> <C-X><C-O>

""""""""""""""""""""""""""""""""""""""""""""""""""
"Searching
""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag word under cursor
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>
" 'V' for visited
noremap <Leader>v :History<CR>
noremap <Leader>f :Ag<CR>
noremap <Leader>z :FZF<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Status
noremap <Leader>gs :vert G<CR>
noremap <Leader>gb :vert Git blame<CR>
noremap <Leader>gp :vert Git pull<CR>
noremap <Leader>gP! :vert Git push<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
""""""""""""""""""""""""""""""""""""""""""""""""""
" Surround word with double quotes
let @z = 'i"jklxx$a"jk0j'

" Cheat Sheet!
""""""""""""""""""""""""""""""""""""""""""""""""""
" FS
" CTRL-G prints current file with full path (from root). press 1 first to get
" full path from $HOME
"
" :e + SPACE + CTRL-D is like :explore in quick-fix window
" 
" SEXP
" slurp/barf: >), <), >(, and <( 
" form: >f <f
" el:   >e <e
"
" PRs
" :G difftool -y [BRANCH] opens tabs of all diffs
"
" REGISTERS 
" :reg to see all; "2p to paste, etc
"
" Tmux:
" Kill all processes: tmux kill-server
" PREFIX: Ctrl + b
" Rename window: PREFIX + ,
" new window: PREFIX + c
" next window: PREFIX + n
" prev window: PREFIX + p
" list windowns: PREFIX + w
" search mode: PREFIX + [
