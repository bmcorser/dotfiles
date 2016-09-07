" Standard bits
let mapleader = ","
set t_Co=256

" Vundle plugin manager
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/Vundle.vim'

" Colours
Bundle 'kien/rainbow_parentheses.vim'

" Syntax
Bundle 'scrooloose/syntastic'
Bundle 'wting/rust.vim'

" Completion
Bundle 'Valloric/YouCompleteMe'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_eager = 1

" Javascript
Bundle 'othree/yajs.vim'

" let g:syntastic_javascript_jshint_args = '--config /home/ben/work/deskgen/dgsource/.jshintrc --verbose'
" let g:syntastic_debug = 3
let g:syntastic_javascript_checkers = ['eslint']

" Makdown edit
Bundle 'suan/vim-instant-markdown'
Bundle 'tpope/vim-markdown'
let g:instant_markdown_slow = 1

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2

Bundle 'goldfeld/vim-seek'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'matze/vim-move'
Bundle 'Valloric/MatchTagAlways'
Bundle 'majutsushi/tagbar'
Bundle 'jgdavey/tslime.vim'
Bundle 'sophacles/vim-bundle-mako'

Bundle 'kana/vim-textobj-user.git'
Bundle 'kana/vim-textobj-entire.git'
Bundle 'kana/vim-textobj-indent.git'
Bundle 'kana/vim-textobj-syntax.git'
Bundle 'kana/vim-textobj-line.git'
Bundle 'reedes/vim-textobj-quote'
Bundle 'posva/vim-vue'
Bundle 'pangloss/vim-javascript'

Plugin 'editorconfig/editorconfig-vim'

Bundle 'tpope/vim-dispatch'
augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType rst call textobj#quote#init()
augroup END

filetype plugin indent on

set laststatus=2
set encoding=utf-8
" For airline
let g:airline_powerline_fonts = 1

" Solarized stuff
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme darkblue

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
set wildignore+=*.pyc,*/bower_components/*,*/node_modules/*,*/lib/*,*/src/*

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" The other type of tabs
set tabpagemax=100

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

" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
set guifont=Inconsolata\ for\ Powerline

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
