setlocal complete+=t
setlocal formatoptions-=t
if v:version > 702 && !&relativenumber
    setlocal number
endif
setlocal nowrap
setlocal commentstring=#%s
setlocal define=^\s*\\(def\\\\|class\\)
setlocal textwidth=119
setlocal colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey
