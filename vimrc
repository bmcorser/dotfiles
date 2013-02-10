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
Bundle 'Lokaltog/python-syntax'
Bundle 'tomasr/molokai'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle "myusuf3/numbers.vim"
Bundle 'sjl/gundo.vim'
" Bundle 'sjl/clam.vim'
Bundle 'kien/tabman.vim'
" Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'xolox/vim-easytags'
Bundle 'majutsushi/tagbar'
Bundle 'davidhalter/jedi-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'

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

" NERDTree binding and toggle
autocmd vimenter * if !argc() | NERDTree | endif
nnoremap <F6> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', 'Session.vim'] " We don't want to go around opening bytecode files or Vim session files now do we?

" Tagbar bindings and options
let g:tagbar_autofocus = 1
nmap <F8> :TagbarToggle<CR>         " Tagbar binding

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NEOCOMPLCACHE SETTINGS
let g:neocomplcache_enable_at_startup = 1 
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : 
let g:neocomplcache_force_overwrite_completefunc = 1
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns['python'] = '[^. \t]\.\w*'
set ofu=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python let b:did_ftplugin = 1
" Vim-jedi settings
let g:jedi#popup_on_dot = 0


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
