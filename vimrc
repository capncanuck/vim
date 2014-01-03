" http://www.charlietanksley.net/philtex/my-vimrc-file/
" http://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc

set nocompatible

" Pathogen - manage the runtime path: http://github.com/tpope/vim-pathogen
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

" Change the leader from the default "\" to ","
let mapleader=","

syntax enable                       " Turn on syntax highlighting.
filetype on                         " Enable filetype detection
filetype indent on                  " Enable filetype-specific indenting
filetype plugin on                  " Enable filetype-specific plugins

" color scheme
set t_Co=256
syntax enable
" colorscheme ir_black

colorscheme molokai
"set list
"set listchars=tab:▸\ ,eol:¬
" The modelines bit prevents some security exploits having to do with modelines in files. 
" I never use modelines so I don’t miss any functionality here.
" set modelines=0

" watch for file changes
set autoread

" don't redraw when don't have to
set lazyredraw

set fileformats=unix
set ff=unix

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
" show matching parenthesis
set showmatch
" hides buffers instead of closing them
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" set number
set relativenumber

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set ignorecase
set smartcase

" Handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1

set pastetoggle=<F2>              " Use F2 to switch to paste mode

set noswapfile
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" Save on focus lost
"au FocusLost * :wa

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

" From http://nvie.com/posts/how-i-boosted-my-vim/
" use w!! to save a file that needs to be edited using sudo
cmap w!! w !sudo tee % >/dev/null

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" See http://henrik.nyh.se/2011/03/vim-ruby-runner
" Set filetype to Ruby with :FR
command! FR set filetype=ruby

" ===================================================================================
" Custom mappings
" ===================================================================================
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
" Well, use <TAB> for tabbing...
nmap <TAB> >>
nmap <S-TAB> <<
vmap <TAB> >gv
vmap <S-TAB> <gv

" A few aliases for the muscle memory...
nmap <C-U> dd
vmap <C-U> dd

" Moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"nmap <C-k> :bnext<CR>
"nmap <C-j> :bprev<CR>

" The first two lines fix Vim’s horribly broken default regex “handling” by automatically inserting a \v before any string you search for
nnoremap / /\v
vnoremap / /\v

" Use F5 to stip trailing whitespace in a file
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Use Ctrl + n to invoke NERDTree
nmap <silent> <c-n> :NERDTreeToggle<CR>

" Bubble single lines
" From http://vimcasts.org/e/26
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Tabbing behaviour
map <D-S-]> gt
map <D-S-[> gT
map <D-1>   1gt
map <D-2>   2gt
map <D-3>   3gt
map <D-4>   4gt
map <D-5>   5gt
map <D-6>   6gt
map <D-7>   7gt
map <D-8>   8gt
map <D-9>   9gt
map <D-0>   :tablast<CR>

" Leader
" Hardwrap paragraphs of text
nnoremap <leader>q gqip

" Use Q for formatting the current paragraph (or selection)
vmap <leader>f gq
nmap <leader>f gqap

" Use IDEA style comment toggle
" Space after c is there on purpose!
nmap <D-/> <leader>c 
vmap <D-/> <leader>c 

map <D-e> :MRU<CR>

" Custom fold mappings
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Toggle search highlight
nnoremap <F3> :set hlsearch!<CR>

" Tagbar shortcut
nmap <F8> :TagbarToggle<CR>

" Abbreviations
ab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


" Enable neocomplcache
let g:neocomplcache_enable_at_startup = 1

" vim2hs
" disable all conceals, including the simple ones like
" lambda and composition
" let g:haskell_conceal              = 0
let g:haskell_multiline_strings = 1
" let g:haskell_autotags = 1
" let g:haskell_tags_generator = 'hasktags'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/dist/*     " MacOSX/Linux

" Ignore certain files when invoking Ctrl-P
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|cabal-dev|\.cabal-sandbox)$',
  \ 'file': '\v\.(hi|o)$',
  \ }

" NerdTree
let NERDTreeIgnore=['\.vim$', '\~$', 'cabal-dev$', 'target$', 'dist$', '.cabal-sandbox$']

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

