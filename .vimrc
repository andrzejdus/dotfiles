" Search
set incsearch
set hlsearch

set nocompatible
set backspace=indent,eol,start
set autoindent
set ruler
set showcmd
set ai
set sw=2
set smarttab
set expandtab
set tabstop=2

set number
set hls ic
set noswapfile
set clipboard=unnamedplus

" show two line status bar
set modeline
set ls=2

filetype plugin on
syntax on
colorscheme desert

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>
" nnoremap <esc> :noh<return><esc>
