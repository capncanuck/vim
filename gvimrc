" ----------------------------------------------------------------------------------
"                                 GUI settings
" ----------------------------------------------------------------------------------
if has("gui_macvim")
	colorscheme molokai
	set guifont=Monaco:h14
	set colorcolumn=85
"   set relativenumber
    " Hide Toolbar
    set guioptions=egmrt
    set undofile
    set stal=2 " turn on tabs by default
"    set lines=25 columns=100
endif
