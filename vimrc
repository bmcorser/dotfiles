" Standard bits
let mapleader = ","
set t_Co=256
set number

" Vundle plugin manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" What to install!?
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'klen/python-mode'
Bundle 'molok/vim-vombato-colorscheme'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'vim-scripts/Rainbow-Parenthesis'
Bundle 'kien/ctrlp.vim'

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

" python-mode stuff
map <Leader>g :call RopeGotoDefinition()<CR>
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_guess_project = 0
let g:pymode_lint = 1
let g:pymode_lint_write = 0
let g:pymode_folding = 0

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

" Reset splits after window size has changed
set <F5>=[15~
noremap <F5> :sp<CR>:q<CR>:vsp<CR>:q<CR>
