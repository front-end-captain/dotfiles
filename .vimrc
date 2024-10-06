if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

set hlsearch
set incsearch
set smartcase
set ignorecase
set nu
set relativenumber
set scrolloff=5

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
nnoremap <C-u> 9j
nnoremap <C-d> 9k
