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
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle "mileszs/ack.vim"
Bundle 'Lokaltog/vim-powerline'
Bundle 'nvie/vim-flake8'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Rainbow-Parenthesis'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin on     " required!
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'skwp'

let g:solarized_termcolors=256

syntax enable
set background=light
colorscheme solarized
set number
