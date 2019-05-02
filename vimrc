" no ESC!
:imap jk <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'jreybert/vimagit'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'guns/vim-sexp',                    {'for': 'clojure'}
Plug 'liquidz/vim-iced',                 {'for': 'clojure'}
Plug 'scrooloose/nerdtree',              {'on' : 'NERDTreeToggle'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'Shougo/deoplete.nvim',             {'do' : ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'clojure-vim/async-clj-omni'
" colorthemes
Plug 'rakr/vim-one'
Plug 'tomasr/molokai'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" BASICS 
"
""""""""""""""""""""""""""""""""""""""""""""""""""

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
