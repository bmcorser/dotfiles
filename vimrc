" Standard bits
let mapleader = ","
set t_Co=256

" Vundle plugin manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" What to install!?
Bundle 'altercation/vim-colors-solarized'
Bundle 'goldfeld/vim-seek'
Bundle 'gmarik/vundle'
Bundle 'kien/tabman.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'lepture/vim-jinja'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/python-syntax'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tomasr/molokai'
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
colorscheme molokai

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

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
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

nnoremap <F7> :NumbersToggle<CR>    " Relative numbers toggle
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
nmap <F8> :TagbarToggle<CR>         " Tagbar binding

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


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
" it will allow you to use :w!! to write to a file using sudo if you forgot to
" sudo vim file (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %
set noerrorbells
set visualbell

" from http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" highlight anything dangling over 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
