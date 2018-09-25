set background=dark
let mapleader = ","

" Vundle plugin manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'goldfeld/vim-seek'
Bundle 'kien/ctrlp.vim'
Bundle 'luochen1990/rainbow'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/MatchTagAlways'
Bundle 'Valloric/YouCompleteMe'

" ctags
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'

set tags=./tags;
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_events = ['BufWritePost']

filetype plugin indent on

set laststatus=2
set encoding=utf-8

" For airline
let g:airline_powerline_fonts = 1


" Better split movement
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Handle indentation
vnoremap < <<gv
vnoremap > >>gv

" Stick to 80 column files
set colorcolumn=79

" Do we really need swap files?
set nobackup
set nowritebackup
set noswapfile

" CtrlP stuff
let g:ctrlp_max_height = 30
set wildignore+=*.pyc

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Cool numbers
set rnu
set nu

nnoremap <F5> :GundoToggle<CR>      " Gundo
set shortmess+=filmnrxoOtT          " Not hitting ENTER

" NERDTree utility function
function s:UpdateNERDTree(stay)
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree
      if !a:stay
        wincmd p
      end
    endif
  endif
endfunction

" NERDTree binding and toggle
nnoremap <F6> :NERDTreeToggle<CR>
" We don't want to go around opening bytecode files or Vim session files now
" do we?
let NERDTreeIgnore=['\.pyc$', 'Session.vim'] 

" Tagbar bindings and options
let g:tagbar_autofocus = 1
nmap <F8> :TagbarToggle<CR>

" Easytags options
let g:easytags_by_filetype = 1
let g:easytags_on_cursorhold = 1
let g:easytags_file = '~/.vimtags'

" Rainbow parens
let g:rainbow_active = 1

"""""
" Up and down
"
"The following mappings in your vimrc provide a quick way to move lines 
"of text up or down. The mappings work in normal, insert and visual modes,
"allowing you to move the current line, or a selected block of lines.

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

""allow pasting in insert mode

nmap <leader>p :set paste!<CR>

" mappings
inoremap jk <Esc>

set noerrorbells
set visualbell

" literally no clue
set nolazyredraw

" hmmmm, go backspace
set backspace=indent,eol,start

" indents
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

let g:syntastic_python_checkers = ['flake8', 'pyflakes']

syntax off
set list
