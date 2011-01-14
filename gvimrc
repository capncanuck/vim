" ----------------------------------------------------------------------------------
"                                 GUI settings
" ----------------------------------------------------------------------------------
if has("gui_macvim")
	colorscheme molokai
	set guifont=Monaco:h14
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

    "Git branch
    function! GitBranch()
        let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
        if branch != ''
            return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
        en
        return ''
    endfunction

    function! CurDir()
        return substitute(getcwd(), '/Users/amir/', "~/", "g")
    endfunction

    function! HasPaste()
        if &paste
            return 'PASTE MODE  '
        en
        return ''
    endfunction

    " Format the statusline
    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}

endif
