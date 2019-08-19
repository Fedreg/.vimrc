imap jk <Esc>
let mapleader = " "
let maplocalleader = ","
""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'jreybert/vimagit'
Plug 'junegunn/fzf',                     { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'guns/vim-sexp',                    {'for': 'clojure'}
Plug 'liquidz/vim-iced',                 {'for': 'clojure', 'branch': 'dev'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',              {'on' : 'NERDTreeToggle'}
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'Shougo/deoplete.nvim',             {'do' : ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'clojure-vim/async-clj-omni'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

""""""""""""""""""""""
" Plug Graveyard (for now)
"
"Plug 'Olical/conjure',                   {'tag': 'v0.24.0', 'do': 'bin/compile'  }
"Plug 'tpope/vim-fireplace',              {'for': 'clojure'}
"
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" BASICS 
"
""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus

"let g:airline_theme='one'
syntax on
colorscheme slate 
set background=dark
" let g:solarized_termcolors=256

" Show matching brackets
set showmatch

" Comments on new line
set formatoptions+=o

" No Highlight remains after search
nnoremap <CR> :noh<CR><CR>

" Autosave on loss of focus
autocmd BufLeave,FocusLost * silent! wall

set ignorecase
set hidden
set updatetime=500

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Conjure
"
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:conjure_log_auto_close = 1
let g:conjure_log_blacklist = []
let g:conjure_quick_doc_normal_mode = 0
let g:conjure_quick_doc_insert_mode = 1
let g:conjure_log_direction = "vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Iced
"
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:iced_enable_default_key_mappings = v:true
let g:iced#buffer#stdout#mods = 'vertical'

