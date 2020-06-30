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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
" need last load
Plug 'ryanoasis/vim-devicons'
call plug#end()

" setting vim-airline
set ttimeoutlen=10

" setting vim
if !has('nvim')
  set backspace=indent,eol,start
endif
