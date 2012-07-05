set nocompatible               " be iMproved
filetype off                   " required!

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
"

" Colorschemes
Bundle 'mutewinter/ir_black_mod'
Bundle 'tomasr/molokai'
Bundle 'cschlueter/vim-wombat'

Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
Bundle "mileszs/ack.vim"
Bundle 'Lokaltog/vim-powerline'
Bundle 'nvie/vim-flake8'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Rainbow-Parenthesis'
"Bundle 'vim-scripts/YankRing.vim'
Bundle 'tpope/vim-unimpaired'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin on     " required!
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'skwp'

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

"let g:solarized_termcolors=256

syntax enable
"set background=dark
colorscheme molokai
set number
