" ----------------------------------------------------------------------------------
"                                 GUI settings
" ----------------------------------------------------------------------------------
if has("gui_macvim")
	colorscheme molokai
	set guifont=Inconsolata:h20
    "set guifont=Monaco:h14
	set colorcolumn=85
"   set relativenumber
    " Hide Toolbar, no scrollbars, autoselect
    set guioptions=egmrt

"    set undofile
"    set stal=2 " turn on tabs by default
"    set lines=25 columns=100

    " This makes Vim show invisible characters with the same characters that TextMate uses.
    set list
    set listchars=tab:▸\ ,eol:¬
endif
