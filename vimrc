" Personal vim setup of Miles McGuire. Fully custom and from scratch, credit
" to spf13 for inspiring the newly redesigned vimrc layout and for the
" neocomplcache config. Free to use for all but no support offered.
"
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

" Bundle Config {

    " Depenencies {
        Bundle 'gmarik/vundle'
    " }

    if !exists('g:minuteman3_bundle_groups')
        let g:minuteman3_bundle_groups=['general', 'programming', 'latex', 'python', 'html', 'haskell']
    endif

    if count(g:minuteman3_bundle_groups, 'general')
        Bundle 'sickill/vim-monokai'
        Bundle 'bling/vim-airline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'mbbill/undotree'
        Bundle 'kien/ctrlp.vim'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-repeat'
        Bundle 'tpope/vim-jdaddy'
        Bundle 'scrooloose/nerdtree'
        Bundle 'SirVer/ultisnips'
        if has("ruby")
            Bundle 'LustyJuggler'
        endif
    endif

    if count(g:minuteman3_bundle_groups, 'programming')
        Bundle 'airblade/vim-gitgutter'
        Bundle 'edkolev/tmuxline.vim'
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/syntastic'
        Bundle 'scrooloose/nerdcommenter'
        if executable('ctags')
            Bundle 'majutsushi/tagbar'
        endif
        Bundle 'Valloric/YouCompleteMe'
    endif

    if count(g:minuteman3_bundle_groups, 'python')
        Bundle 'klen/python-mode'
        Bundle 'python.vim'
        Bundle 'python_match.vim'
        Bundle 'pythoncomplete'
    endif

    if count(g:minuteman3_bundle_groups, 'latex')
        Bundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
    endif

    if count(g:minuteman3_bundle_groups, 'html')
        Bundle 'amirh/HTML-AutoCloseTag'
        Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
    endif

    if count(g:minuteman3_bundle_groups, 'haskell')
        "Bundle 'wlangstroth/vim-haskell'
        Bundle 'dag/vim2hs'
    endif

" }

" Plugin Config {
    " Tags {
        set tags=./tags;/,~/.vimtags
    " }

    " UndoTree {
        nnoremap <Leader>u :UndotreeToggle<CR>
    " }

    " PythonMode {
    if !has('python')
        let g:pymode = 1
    endif
    " }

    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " }

    " vim-LaTeX {
        set grepprg =grep\ -nH\ $*
        let g:tex_flavor='latex'
    " }
" }

if has("persistent_undo")
    set undodir="$HOME/.vim_scratch"
    set undofile
endif

filetype plugin indent on
colorscheme monokai
syntax on
au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_gb
set number
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
set foldlevelstart=2

set autoindent
set copyindent

if version >= 703
    set cm=blowfish
endif

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

set ffs=unix,dos,mac
" Add a bind for clearing active highlighted searches.

nnoremap <silent> ,/ :nohlsearch<CR>

" Add a bind for clearing active highlighted searches.

nnoremap <silent> ,/ :nohlsearch<CR>

" Always show status line

set laststatus=2

" Use UTF-8 for fancy characters

set encoding=utf-8

" The toolbar is a waste of screen space and totally contrary to the keyboard
" centric vim style. Gone.

if has("gui_running")
    set guioptions=-t
endif

autocmd FileType lhaskell setlocal formatoptions+=ro

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
