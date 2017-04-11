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
"set autoindent
"set smartindent
set smarttab

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

" 自動括弧閉じ
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

filetype on
