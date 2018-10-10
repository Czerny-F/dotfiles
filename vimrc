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


" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" ALE
NeoBundle 'w0rp/ale'

" Scala 用syntax highlight
NeoBundle 'derekwyatt/vim-scala'

" Python
NeoBundle 'Vimjas/vim-python-pep8-indent'
NeoBundle 'nvie/vim-flake8'

" HTML/CSS入力補助
NeoBundle 'mattn/emmet-vim'

" TypeScript
" Syntax
NeoBundle 'leafgarland/typescript-vim'
" like IDE
" NeoBundle 'Shougo/vimproc'
" NeoBundle 'Quramy/tsuquyomi'

" CSS3 / HTML5
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'

" Vue.js
NeoBundle 'posva/vim-vue'

" NERDTree
NeoBundle 'scrooloose/nerdtree'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven guibg=green ctermbg=4

" for Python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" vim-flake8
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1
" let g:flake8_show_in_file=1
let g:flake8_error_marker='EE'
let g:flake8_warning_marker='WW'

" https://github.com/nvie/vim-flake8#max-line-lengths
" $ vim ~/.config/flake8
" [flake8]
" max-line-length = 120

" Jinja2
" http://www.vim.org/scripts/script.php?script_id=1856
" copy jinja.vim, htmljinja.vim into ~/.vim/syntax

" and ftdetect from
" https://github.com/Glench/Vim-Jinja2-Syntax/blob/master/ftdetect/jinja.vim
" and modified
" Figure out which type of hilighting to use for html.
fun! s:SelectHTML()
  let n = 1
  while n < 50 && n <= line("$")
    " check for jinja
    if getline(n) =~ '{{.*}}\|{%-\?\s*\(end.*\|extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      " if expand("%:p") =~ 'jinja'
        set ft=htmljinja
        return
      " endif
      " set ft=htmldjango
      " return
    endif
    let n = n + 1
  endwhile
endfun
autocmd BufNewFile,BufRead *.html,*.htm,*.nunjucks,*.nunjs  call s:SelectHTML()
autocmd BufNewFile,BufRead *.jinja2,*.j2,*.jinja set ft=jinja

" posva/vim-vue
autocmd FileType vue syntax sync fromstart

" NERDTree shortcut
nnoremap <silent><C-e> :NERDTreeToggle<CR>


filetype on
