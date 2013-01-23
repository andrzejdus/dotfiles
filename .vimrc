"
" --- initial settings
"

" get hostname
let hostname = substitute(system('hostname'), '\n', '', '')

"
" --- plugins ---
"

filetype plugin indent on

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


"
" --- settings ---
"

syntax on
colorscheme desert

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
set timeoutlen=100000 " disable leader timeout
set nomousehide

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

" tab completion style
set wildmode=longest,list,full
set wildmenu

" gui settings
set guioptions-=r 
set guioptions-=R 
set guioptions-=l 
set guioptions-=L 
set guioptions-=e 
set guioptions-=m 
set guioptions+=c 
set guioptions-=T 
if hostname == "Andrzejs-MacBook-Air"
  set gfn=Andale\ Mono:h13
endif


"
" --- maps --- "
"


" toggle cursorline
map <silent> <Leader>c :set cursorline!<CR>

" disable cursor keys
map <up> <C-y>
map <down> <C-e>
map <left> <nop>
map <right> <nop>

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remap : to ;
nnoremap ; :

" remap : to q:i
" nnoremap ; q:i

" quickly edit/reload the vimrc file
cnoremap ev e $MYVIMRC
cnoremap sov so $MYVIMRC

" map w!! to sudo write
cnoremap w!! w !sudo tee % >/dev/null


" 
" --- leader maps ---
"


" change the mapleader from \ to ,
let mapleader=","

" remap ; to <leader>;
nnoremap <leader>; ;

" unsets the last search pattern register
nmap <silent> <leader>/ :nohlsearch<CR>

" eclim
nnoremap <silent> <buffer> <leader>ji :JavaImport<cr>
nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

