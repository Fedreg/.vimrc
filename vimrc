""""""""""""""""""""""""""""""""""""""""""""""""""
"
" BASICS
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't worry about compatibility with VI
set nocompatible 
" Create <FILENAME>.un~ files whenever you edit a file.
" This lets you used UNDO even after you close and reopen a file.
set undofile

" Leader
let mapleader = " "
let maplocalleader = ","

"save current buffer
nnoremap <leader>w :w<cr>

" Autosave on loss of focus
autocmd BufLeave,FocusLost * silent! wall

"replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Case insensitive if lowercase search; sensitive if upper...
set ignorecase
set smartcase

" Don't need /g in searches
set gdefault

" It's... complicated..  see :help 'hidden'
set hidden

" Auto save if not typing for 5 secs
set updatetime=5000

" Make linux clipboard more like Mac, single
set clipboard=unnamedplus

set foldmethod=indent
" Start with folds open.  zC closes all; zR opens all
set nofoldenable
" Highlight the words you're going to replace
set inccommand=split
" Clean Whitespace from file ith SPACE W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" No Highlight remains after search
nnoremap <CR> :noh<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'ajmwagar/vim-deus'
Plug 'clojure-vim/async-clj-omni',       {'for': 'clojure'}
Plug 'guns/vim-sexp',                    {'for': 'clojure'}
Plug 'iamcco/markdown-preview.nvim',     { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf',                     { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'neoclide/coc.nvim',                {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fireplace',              {'for': 'clojure'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" UI
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme
syntax enable 
set background=dark
colorscheme deus
let g:lightline = { 'colorscheme': 'deus' }
set termguicolors

au VimEnter * RainbowParentheses

" Show matching brackets
set showmatch
" Don't show -- INSERT -- under status line
set noshowmode

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Markdown
"
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mkdp_auto_start = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Fireplace 
"
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>eb :Require<CR>
nmap <Leader>ee cpp
nmap <Leader>ss :Last<CR>
nmap <Leader>sq <C-w>z
nmap <Leader>sp :lprevious<CR>
nmap <Leader>sn :lnext<CR>
nmap <Leader>st <C-w>H
nmap <Leader>tn :RunTests<CR>
nmap <Leader>tt :.RunTests<CR>
nmap <Leader><C-]> [<C-D>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" EasyAlign
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" visual mode
xmap ga <Plug>(EasyAlign)
" motion mode
nmap ga <Plug>(EasyAlign)
" clojure specific
nnoremap <buffer> <leader>a[ vi[<c-v>$:EasyAlign\ g/^\S/<cr>gv=
nnoremap <buffer> <leader>a{ vi{<c-v>$:EasyAlign\ g/^\S/<cr>gv=

let g:sexp_enable_insert_mode_mappings = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Navigation
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Use JK instead of ESC
imap jk <Esc>

" Use ESC to exit neovim terminal
tnoremap jk <C-\><C-n>

" Navigation
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Use TAB to jump to matching brace (like %)
noremap <tab> %

""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Searching
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Last visited buffer
noremap <Leader>l <C-^>

noremap <Leader>b :Buffers<CR>

" Ag word under cursor
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

" 'V' for visited
noremap <Leader>v :History<CR> 

noremap <Leader>f :Ag<CR>

noremap <Leader>z :FZF<CR>

" Git Status
noremap <Leader>gs :vert G<CR>
noremap <Leader>gb :vert Gblame<CR>
noremap <Leader>gp :vert Git push<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Key Reminders
" 
""""""""""""""""""""""""""""""""""""""""""""""""""

" TMUX
""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux kill-server - kill all sessions
" set -g status off - kill status line
"
" PREFIX $ - rename session
" PREFIX c - new window
" PREFIX & - kill window
" PREFIX , - rename window
" PREFIX w - list windows


