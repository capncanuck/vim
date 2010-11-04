" http://www.charlietanksley.net/philtex/my-vimrc-file/
" http://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc

set nocompatible

" Pathogen - manage the runtime path: http://github.com/tpope/vim-pathogen
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

syntax enable                       " Turn on syntax highlighting.
filetype on                         " Enable filetype detection
filetype indent on                  " Enable filetype-specific indenting
filetype plugin on                  " Enable filetype-specific plugins

" color scheme
set t_Co=256
syntax enable


" The modelines bit prevents some security exploits having to do with modelines in files. I never use modelines so I don’t miss any functionality here.
set modelines=0

" Indentation without hard tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

" Try to not use the arrow keys... See how that works out.
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Use TextMates tab mappings
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Faster Esc
"inoremap <Esc> <nop>
"inoremap jj <Esc>
imap ;; <Esc>

" The first two lines fix Vim’s horribly broken default regex “handling” by automatically inserting a \v before any string you search for
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase


" Handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1


" This makes Vim show invisible characters with the same characters that TextMate uses.
set list
set listchars=tab:▸\ ,eol:¬

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

au FocusLost * :wa


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

" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Use F5 to stip trailing whitespace in a file
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Bubble single lines
" From http://vimcasts.org/e/26
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
