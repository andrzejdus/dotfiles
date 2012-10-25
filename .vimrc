set nocompatible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set number
set ruler
set showcmd
set sw=2
set smarttab
set expandtab
set tabstop=2
set showmatch " set show matching parenthesis
set noswapfile 
set title " change the terminal's title
set visualbell " don't beep
set noerrorbells " don't beep

" set clipboard=unnamedplus

" search
set incsearch
" set hls ic
set hlsearch
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

" show two line status bar
set modeline
set ls=2

set pastetoggle=<F2>

" gui settings
set guioptions=-r
set guioptions=-R
set guioptions=-l
set guioptions=-L

" change the mapleader from \ to ,
let mapleader=","

" quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

" toggle cursorline
map <silent> <Leader>c :set cursorline!<CR>

" remap : to ;
nnoremap ; :

" remap ; to <leader>;
nnoremap <leader>; ;

"This unsets the last search pattern register by hitting return
nmap <silent> <leader>/ :nohlsearch<CR>

" disable cursor keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" tab navigation
cabbrev tabv tab sview +setlocal\ nomodifiable

" map w!! to sudo write
cmap w!! w !sudo tee % >/dev/null

syntax on
colorscheme desert

filetype plugin indent on

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" eclim
nnoremap <silent> <buffer> <leader>ji :JavaImport<cr>
nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

set guioptions-=r 
set guioptions-=R 
set guioptions-=l 
set guioptions-=L 
set guioptions-=e 
" set gfn=Andale\ Mono:h13
