" Environment Setup {

    " Basic setup {
        set nocompatible
        set background=dark
    " }

    " Vundle setup {
        filetype off
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    " }

" }
syntax on
set spell
set number
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set foldlevelstart=2

set autoindent
set copyindent

set cm=blowfish

filetype on
filetype indent on
filetype plugin on

set noshowmode

set showmatch

" Free the cursor in visual block mode so you can highlight arbitrary
" text/shapes even if there are no characters in the space.

set virtualedit=block

" Make search results case sensitive only if using mixed case

set ignorecase
set smartcase

set hlsearch
set incsearch

" Store ALL THE HISTORY

set history=1000
set undolevels=1000

" Ignore crap I don't need when tab completing file names

set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.svn,*.git,*.hg,*.o,*.a,*.jpg,*.png,*.gif

" Change terminal title if we're running in a terminal session

set title

" Get rid of annoying bells

set novisualbell
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
map <F1> <ESC>
nnoremap ; :

set background=dark

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

" The toolbar is a waste of screen space and totally contrary to the keyboard
" centric vim style. Gone.

if has("gui_running")
    set guioptions=-t
endif

" Make the indent guides a little less ugly by only occupying one column

let g:indent_guides_guide_size = 1
