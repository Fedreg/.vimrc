""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Plug 'fedreg/vim-clj-debug',            {'for': 'clojure'}
Plug 'fedreg/vim-fireplace-plus',       {'for': 'clojure'}
Plug 'iamcco/markdown-preview.nvim',    { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fireplace',             {'for': 'clojure'}
Plug 'tpope/vim-fugitive'
Plug 'venantius/vim-cljfmt',            {'for': 'clojure'}
Plug 'zaptic/elm-vim',                  {'for': 'elm'}
Plug 'Fedreg/deeper-blue.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" BASICS
""""""""""""""""""""""""""""""""""""""""""""""""""
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

"save current buffer
nnoremap <leader>w :w<cr>

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
colorscheme deeper-blue
highlight VertSplit cterm=NONE
let g:lightline = {
            \ 'colorscheme': 'one',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified'] ],
            \   'right': [ [ 'gitbranch' ],
            \              [ 'filetype' ],
            \              [ 'lineinfo', 'percent' ] ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B'
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ }
            \ }
" }}}

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
" Fireplace
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>eb :w<CR> :Require<CR>
nnoremap <Leader>ee cpp
nnoremap <Leader>ss :Last<CR><C-w>H
nnoremap <Leader>sq <C-w>z
nnoremap <Leader>sp :lprevious<CR>
nnoremap <Leader>sn :lnext<CR>
nnoremap <Leader>tn :RunTests<CR>
nnoremap <Leader>tt :.RunTests<CR>
nnoremap <Leader><C-]> [<C-D>

" firplace+
nnoremap <Leader>xi :DbxInstrument<CR>
nnoremap <Leader>xu :DbxUnstrument<CR>
let g:clj_fmt_autosave = 0

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Tab for autocomplete in insert mode
inoremap <TAB> <C-X><C-O>

""""""""""""""""""""""""""""""""""""""""""""""""""
"Searching
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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Status
noremap <Leader>gs :vert G<CR>
noremap <Leader>gb :vert Git blame<CR>
noremap <Leader>gp :vert Git push<CR>

