set nobackup
set noswapfile

set number
set ruler
set laststatus=2

set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" if fugitive
"set statusline+=%{fugitive#statusline()}
set title

set wildmenu
set showcmd
set smartcase

set hlsearch
set background=dark

set incsearch
set hidden
set showmatch
"set list

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab

syntax on
