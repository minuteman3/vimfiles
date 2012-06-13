syntax on
set number
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

set autoindent
set copyindent

filetype on
filetype indent on
filetype plugin on

set showmatch

" Make search results case sensitive only if using mixed case

set ignorecase
set smartcase

set hlsearch
set incsearch

" Store ALL THE HISTORY

set history=1000
set undolevels=1000

" Ignore crap I don't need when tab completing file names

set wildignore=*.swp,*.bak,*.pyc,*.class

" Change terminal title if we're running in a terminal session

set title

" Get rid of annoying bells

set visualbell
set noerrorbells

" Annoying outmoded backup methods BE GONE.

set nobackup
set noswapfile

" Whitespace highlighting a la SublimeText

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Unbind arrow keys and some other various remaps

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

colorscheme mustang 

" Initialising Pathogen for easier plugin setup

call pathogen#infect()
call pathogen#helptags()

nnoremap <silent> <C-D> :NERDTreeToggle<CR>

" Python Specific Stuff

autocmd BufWritePost *.py call Flake8() " Run flake8 whenever saving .py files!

" Hide that nasty looking YankRing history file from ~/

let g:yankring_history_file = '.YankRing_history'

" Add a bind for clearing active highlighted searches.

nnoremap <silent> ,/ :nohlsearch<CR>

" Add a bind for clearing active highlighted searches.

nnoremap <silent> ,/ :nohlsearch<CR>

" Disable vi compatibility mode

set nocompatible

" Always show status line

set laststatus=2

" Use UTF-8 for fancy characters

set encoding=utf-8

" Set up PowerLine for a nicer status bar

" let g:Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'unicode'
" let g:Powerline_symbols = 'fancy' " Fancy symbols in powerline (might not work on some setups!)
