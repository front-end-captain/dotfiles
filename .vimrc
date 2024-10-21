" set leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

set nocompatible

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

" enable syntax hightlight and completion
syntax on
filetype on

set confirm
set hlsearch
set incsearch
set smartcase
set ignorecase
set nu
set relativenumber
set scrolloff=5
set showmode
set copyindent

nnoremap L $
nnoremap dL d$
nnoremap yL y$
nnoremap cL c$
vnoremap H ^
nnoremap dH d^
nnoremap yH y^
nnoremap cH c^
nnoremap H ^
vnoremap L $

nnoremap <C-j> 4j
nnoremap <C-k> 4k
nnoremap <C-u> 9k
nnoremap <C-d> 9j

" clear the highlighted search result
nnoremap <Leader>l :nohlsearch<CR>

" copy and paste
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>P "0p
vnoremap Y "+y

" quit/close current window
" nnoremap <Leader>q <C-W>w
" nnoremap <Leader>q :q<CR>
