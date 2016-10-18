" VIM CONFIGURATION


set nocompatible
filetype plugin indent on
syntax enable
set termguicolors
colorscheme molokai
let g:rehash=1
let s:molokai_original = 1

" Plug
call plug#begin('~/.vim/plugged')
source $HOME/.vim/plugins.vim
call plug#end()

source $HOME/.vim/settings.vim

