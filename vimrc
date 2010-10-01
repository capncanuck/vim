" http://www.charlietanksley.net/philtex/my-vimrc-file/
" http://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc

" color scheme
set t_Co=256
syntax enable

set nocompatible

" The modelines bit prevents some security exploits having to do with modelines in files. I never use modelines so I don’t miss any functionality here.
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

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

" Try to not use the arrow keys... See how that works out.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

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


au FocusLost * :wa
