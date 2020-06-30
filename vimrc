scriptencoding utf-8

if has('vim_starting') " Changing encoding in Vim at runtime is undefined behavior.
  set fileencodings=utf-8,sjis,cp932,euc-jp
  set fileformats=unix,mac,dos
endif

" setting vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
" fzfはaptで入れても入ると思う
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

" setting vim-airline
set ttimeoutlen=10

" setting vim
if !has('nvim')
  set backspace=indent,eol,start
endif

syntax enable
filetype plugin indent on

set number
set autoindent
set smartindent
" インクリメンタルサーチ
set incsearch
set nobackup
set noswapfile

" ファイルタイプごとにインデントを設定
augroup MyFileTypeIndentOverRide
  autocmd!
  autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" インデントを一括で行う
function s:Indent()
  let save_cursor = getcurpos()
  execute "normal " . "gg=G"
  call setpos('.', save_cursor)
endfunction

" インデントコマンドを定義
command -nargs=0 Indent call s:Indent()
