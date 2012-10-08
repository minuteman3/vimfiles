" Personal vim setup of Miles McGuire. Fully custom and from scratch, credit
" to spf13 for inspiring the newly redesigned vimrc layout and for the
" neocomplcache config. Free to use for all but no support offered.

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
        let g:minuteman3_bundle_groups=['general', 'programming', 'python', 'php', 'html', 'scala', 'haskell']
    endif

    if count(g:minuteman3_bundle_groups, 'general')
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'Lokaltog/vim-powerline'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'mbbill/undotree'
        Bundle 'kien/ctrlp.vim'
        Bundle 'tpope/vim-surround'
        Bundle 'tpope/vim-repeat'
        Bundle 'scrooloose/nerdtree'
        if has("ruby")
            Bundle 'LustyJuggler'
        endif
        if version >= 703
            Bundle 'myusuf3/numbers.vim'
        endif
    endif

    if count(g:minuteman3_bundle_groups, 'programming')
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/syntastic'
        Bundle 'scrooloose/nerdcommenter'
        if executable('ctags')
            Bundle 'majutsushi/tagbar'
        endif
        Bundle 'Shougo/neocomplcache'
    endif

    if count(g:minuteman3_bundle_groups, 'python')
        Bundle 'klen/python-mode'
        Bundle 'python.vim'
        Bundle 'python_match.vim'
        Bundle 'pythoncomplete'
    endif

    if count(g:minuteman3_bundle_groups, 'php')
        Bundle 'spf13/PIV'
    endif

    if count(g:minuteman3_bundle_groups, 'html')
        Bundle 'amirh/HTML-AutoCloseTag'
        Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
    endif

    if count(g:minuteman3_bundle_groups, 'scala')
        Bundle 'derekwyatt/vim-scala'
        Bundle 'derekwyatt/vim-sbt'
    endif

    if count(g:minuteman3_bundle_groups, 'haskell')
        Bundle 'wlangstroth/vim-haskell'
    endif
" }

" Plugin Config {
    " Tags {
        set tags=./tags;/,~/.vimtags
    " }

    " PowerLine {
        " let g:Powerline_symbols = 'compatible'
        " let g:Powerline_symbols = 'unicode'
        let g:Powerline_symbols = 'fancy'
        call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
    " }

    " neocomplcache {
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_enable_auto_delimiter = 1

        " AutoComplPop like behavior.
        let g:neocomplcache_enable_auto_select = 0

        " <CR>: close popup
        " <s-CR>: close popup and save indent.
        inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"

        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

        " For snippet_complete marker.
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
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
" }

if has("persistent_undo")
    set undodir = '$HOME/.vim_scratch'
    set undofile
endif

filetype plugin indent on
colorscheme solarized
syntax on
set mouse=a
set spell
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

" Always show status line

set laststatus=2

" Use UTF-8 for fancy characters

set encoding=utf-8

" The toolbar is a waste of screen space and totally contrary to the keyboard
" centric vim style. Gone.

if has("gui_running")
    set guioptions=-t
endif
