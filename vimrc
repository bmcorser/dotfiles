" Standard bits
let mapleader = ","
set t_Co=256

" Vundle plugin manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" What to install!?
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tomasr/molokai'
"Bundle 'vim-scripts/Rainbow-Parenthesis'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle "myusuf3/numbers.vim"
Bundle 'sjl/gundo.vim'
Bundle 'sjl/clam.vim'
Bundle 'xolox/vim-easytags'

filetype plugin indent on

" For Powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'skwp'

" Solarized stuff
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" Better split movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Handle indentation
vnoremap < <<gv
vnoremap > >>gv

" Stick to 80 column files
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Do we really need swap files?
set nobackup
set nowritebackup
set noswapfile

" CtrlP stuff
let g:ctrlp_max_height = 30
set wildignore+=*.pyc

function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent>j <C-R>=OmniPopup('j')<CR>
inoremap <silent>k <C-R>=OmniPopup('k')<CR>

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" setting F-keys to <F-keys> on my system
set <F9>=[20~
set <F12>=[24~
set <F2>=OQ
set <F3>=OR

" Binding new <F-keys> to Fugitive commands
noremap <F9> :diffget //2<CR>:diffupdate<CR>
noremap <F12> :diffget //3<CR>:diffupdate<CR>
noremap <F2> :cnext<CR>
noremap <F3> :cprevious<CR>

" Ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

nmap <F8> :TagbarToggle<CR>         " Tagbar binding
nnoremap <F7> :NumbersToggle<CR>    " Relative numbers toggle
nnoremap <F5> :GundoToggle<CR>      " Gundo
set shortmess+=filmnrxoOtT          " Not hitting ENTER
