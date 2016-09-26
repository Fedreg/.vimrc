
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set t_Co=256
set background=dark
colo slate 
filetype plugin indent on
syntax on 
inoremap jk <ESC>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
let mapleader = "\<Space>"
set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'ajh17/vimcompletesme'
Plug 'othree/yajs.vim', { 'for': 'javascript'}
Plug 'othree/es.next.syntax.vim'
Plug 'elzr/vim-json'
Plug 'othree/jsdoc-syntax.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install'}
Plug 'othree/jspc.vim'
Plug 'moll/vim-node'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'posva/vim-vue'  
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'elmcast/elm-vim'

let g:polyglot_disabled =['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1

Plug 'sheerun/vim-polyglot'

call plug#end()

