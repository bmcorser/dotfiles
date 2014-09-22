if &shell =~# 'fish$'
    set shell=bash
endif

" Standard bits
let mapleader = ","
set t_Co=256

" Vundle plugin manager
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" What to install!?
Plugin 'gmarik/vundle'
Plugin 'dag/vim-fish'
Plugin 'altercation/vim-colors-solarized'
Plugin 'goldfeld/vim-seek'
Plugin 'kien/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'lepture/vim-jinja'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_eager = 0
Plugin 'matze/vim-move'
Plugin 'Valloric/MatchTagAlways'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'majutsushi/tagbar'
Plugin 'jgdavey/tslime.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'saltstack/salt-vim'
Plugin 'vim-scripts/vim-vagrant'
Plugin 'sophacles/vim-bundle-mako'

filetype plugin indent on

set laststatus=2
set encoding=utf-8
" For airline
let g:airline_powerline_fonts = 1

" Solarized stuff
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme Tomorrow

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

" from http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" highlight anything dangling over 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" Whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

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
noremap <F3> :next<CR>
noremap <F2> :previous<CR>
" Ack.vim
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Cool numbers
set nu
set rnu

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
let g:rainbow_conf = {
\    'guifgs': [
\        'RoyalBlue3',
\        'DarkSlateBlue3',
\        'SprintGreen3',
\        'DarkOliveGreen3',
\        'LightGoldenRod2',
\        'DarkGoldenRod2',
\        'IndianRed3',
\        'firebrick3',
\        'DeepPink3',
\        'LightPink2',
\        'VioletRed2',
\        'magenta3',
\        'DarkOrchid3',
\        'MediumPurple3'
\    ],
\    'ctermfgs': [
\        'Red',
\        'Magenta',
\        'Blue',
\        'Green',
\        'Cyan'
\   ]
\}

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

autocmd FileType python map <buffer> <F4> :call Flake8()<CR>

nmap <F11> :TMToggle<CR>

" Tslime bits and pieces
vmap ok <Plug>SendSelectionToTmux
nmap <Space>ko <Plug>SetTmuxVars

" literally no clue
set nolazyredraw

" hmmmm, go backspace
set backspace=indent,eol,start

let g:virtualenv_auto_activate = 1

" fish
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

" folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=2
nnoremap <space> za
vnoremap <space> zf
