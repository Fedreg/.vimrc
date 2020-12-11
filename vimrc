
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

" Clean Whitespace from file with SPACE W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" No Highlight remains after search
nnoremap <CR> :noh<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" PLUGINS
"
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'cocopon/iceberg.vim'
Plug 'clojure-vim/async-clj-omni',       {'for': 'clojure'}
Plug 'guns/vim-sexp',                    {'for': 'clojure'}
Plug 'iamcco/markdown-preview.nvim',     { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'itchyny/landscape.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf',                     { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'liquidz/vim-iced',                 {'for': 'clojure', 'branch': 'master'}
Plug 'liquidz/vim-iced-coc-source',      {'for': 'clojure'}
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim',                {'branch': 'release'}
Plug 'radenling/vim-dispatch-neovim'
Plug 'rigellute/rigel'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'jacoborus/tender.vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" UI
"
""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme
syntax enable 
set background=dark
colorscheme rigel
"let g:lightline = { 'colorscheme': 'landscape' }

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
" Iced
"
""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:iced_enable_default_key_mappings = v:true
let g:iced#buffer#stdout#mods = 'vertical'
"let g:iced#popup#neovim#winhighlight = 'Normal:Normal'
let g:iced_enable_clj_kondo_analysis = v:true

nmap <Leader>'  <Plug>(iced_connect)
nmap <Leader>"  <Plug>(iced_jack_in)
nmap <Leader>ea <Plug>(iced_eval_at_mark)
nmap <Leader>ee <Plug>(iced_eval)<Plug>(sexp_outer_list)
vmap <Leader>ee <Plug>(iced_eval_visual)
nmap <Leader>ep <Plug>(iced_print_last)
nmap <Leader>eb <Plug>(iced_require)
nmap <Leader>eB <Plug>(iced_require_all)
nmap <Leader>eu <Plug>(iced_undef)
nmap <Leader>eU <Plug>(iced_undef_all_in_ns)
nmap <Leader>eq <Plug>(iced_interrupt)
nmap <Leader>eQ <Plug>(iced_interrupt_all)
nmap <Leader>tt <Plug>(iced_test_under_cursor)
nmap <Leader>ts <Plug>(iced_test_spec_check)
nmap <Leader>to <Plug>(iced_test_buffer_open)
nmap <Leader>tn <Plug>(iced_test_ns)
nmap K          <Plug>(iced_document_popup_open)
nmap <Leader>hb <Plug>(iced_document_open)
nmap <Leader>hu <Plug>(iced_use_case_open)
nmap <Leader>hn <Plug>(iced_next_use_case)
nmap <Leader>hN <Plug>(iced_prev_use_case)
nmap <Leader>hq <Plug>(iced_document_close)
nmap <Leader>hs <Plug>(iced_source_popup_show)
nmap <Leader>hS <Plug>(iced_source_show)
nmap <Leader>hc <Plug>(iced_clojuredocs_open)
nmap <Leader>hh <Plug>(iced_command_palette)
nmap <C-]>      <Plug>(iced_def_jump)
nmap ==         <Plug>(iced_format)
nmap <Leader>ss <Plug>(iced_stdout_buffer_open)
nmap <Leader>sl <Plug>(iced_stdout_buffer_clear)
nmap <Leader>sq <Plug>(iced_stdout_buffer_close)

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
" Searching
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

""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Key Reminders
" 
""""""""""""""""""""""""""""""""""""""""""""""""""

" VIM
""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl + Z : suspend
" fg       : resume
"
"
" TMUX
""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux kill-server - kill all sessions
" set -g status off - kill status line
" Ctrl + b $ - rename session
" Ctrl + b c - new window
" Ctrl + b & - kill window
" Ctrl + b , - rename window

