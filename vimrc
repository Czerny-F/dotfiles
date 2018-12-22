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
"set background=dark

set incsearch
set hidden
set showmatch
"set list
"set listchars=tab:-»,trail:»

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start

syntax on

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif

" for Python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

filetype on


" dein.vim
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/lee/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/lee/.cache/dein')
  call dein#begin('/Users/lee/.cache/dein')

  " Let dein manage dein
  call dein#add('/Users/lee/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  call dein#add('bronson/vim-trailing-whitespace')

  call dein#add('w0rp/ale')
  call dein#add('Shougo/neocomplete.vim')

  call dein#add('mattn/emmet-vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('Quramy/tsuquyomi')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" NERDTree shortcut
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Enable omni completion.

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

