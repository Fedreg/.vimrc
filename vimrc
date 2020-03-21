""""""""""""""""""""""""""""""""""""""""""""""""""
"
" BASICS 
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" when I change to a new directory, CD into the parent folder
" When you hit :e, for example, you'll be right there and not back at 
" project root
au! BufRead,BufNewFile * lcd %:p:h

" Use JK instead of ESC
imap jk <Esc>

" Don't worry about compatibility with VI
set nocompatible

" Create <FILENAME>.un~ files whenever you edit a file. 
" This lets you used UNDO even after you close and reopen a file.
set undofile

" Make Vim RegEx more like normal RegEx
nnoremap / /\v
vnoremap / /\v

" Leader
let mapleader = " "
let maplocalleader = ","

" Autosave on loss of focus
autocmd BufLeave,FocusLost * silent! wall

" Case insensitive if lowercase search; sensitive if upper...
set ignorecase
set smartcase

" Don't need /g in searches
set gdefault

" Use TAB to jump to matching brace (like %)
nnoremap <tab> %
vnoremap <tab> %

" Clean Whitespace from file with SPACE W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" It's... complicated..  see :help 'hidden'
set hidden

" Auto save if not typing for 5 secs
set updatetime=5000

" Make linux clipboard more like Mac, single
set clipboard=unnamedplus

" Comments on new line
set formatoptions+=o

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" MOVEMENT 
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'jreybert/vimagit'
Plug 'junegunn/fzf',                     { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'guns/vim-sexp',                    {'for': 'clojure'}
Plug 'clojure-vim/async-clj-omni',       {'for': 'clojure'}
Plug 'liquidz/vim-iced',                 {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source',      {'for': 'clojure'}
Plug 'neoclide/coc.nvim',                {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'Shougo/deoplete.nvim',             {'do' : ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elmcast/elm-vim'
Plug 'morhetz/gruvbox'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
"
" UI 
"
""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:airline_theme='one'
syntax on
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" Show matching brackets
set showmatch

" No Highlight remains after search
nnoremap <CR> :noh<CR><CR>

" NERDTree 
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Iced
"
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:iced_enable_default_key_mappings = v:true
let g:iced#buffer#stdout#mods = 'vertical'

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Fzf 
"
""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <Leader>b :Buffers<CR>
noremap <Leader>h :History<CR>
noremap <Leader>f :Ag<CR>
" Ag word under cursor
noremap <Leader>d :exe ':Ag ' . expand('<cword>')<CR>

