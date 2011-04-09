"
" Personal preference .vimrc file
" Gunther Groenewege
" based upon the file by Vincent Driessen
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"

" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on       " enable detection, plugins and indenting in one step

" Change the mapleader from \ to ,
let mapleader=","


" ==============================================================================
" Editing behaviour
" ==============================================================================

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·,eol:¬

" regex fix
nnoremap / /\v
vnoremap / /\v


" ==============================================================================
" Editor layout
" ==============================================================================

set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in
set ch=2                        " Make command line two lines high
set statusline=%<%f\ %h%m%r\ Buf:\ #%n%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)


" ==============================================================================
" Vim behaviour
" ==============================================================================

set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set backupdir=~/.vim/backup		" swap files
set directory=~/.vim/backup
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore+=.git,.svn
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
set nomodeline                  " disable mode lines (security measure)
set ttyfast                     " always use a fast terminal


" ==============================================================================
" Highlighting
" ==============================================================================

if &t_Co >= 256 || has("gui_running")
   colorscheme wombat
endif

if &t_Co > 2 || has("gui_running")
   syntax on                    " switch syntax highlighting on, when the terminal has colors
endif


" ==============================================================================
" Filetypes
" ==============================================================================

" Help files
au filetype help set nonumber      " no line numbers when viewing help
au filetype help nnoremap <buffer><CR> <C-]>   " Enter selects subject
au filetype help nnoremap <buffer><BS> <C-T>   " Backspace to go back


" ==============================================================================
" Shortcut mappings
" ==============================================================================

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap


" Use the damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcut to rapidly toggle hidden caracters
nmap <leader>l :set list!<CR>

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Run Ack fast
nnoremap <leader>a :Ack<Space>

" Convert markdown to html
nmap <leader>md :%!/usr/local/bin/markdown<CR>

" Preview file in safari
map <leader>s :!open -a Safari %<CR><CR>

" surround with strong or em tags
map <leader>b lbi<strong><Esc>ea</strong><Esc>
map <leader>i lbi<em><Esc>ea</em><Esc>

" space as pagedown like web browser 
nmap <space> <pagedown>


" ==============================================================================
" Abreviations
" ==============================================================================

ab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
ab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
ab lllorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


" ==============================================================================
" NERDTree settings
" ==============================================================================

let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>N :NERDTreeClose<CR>


" ==============================================================================
" Lusty-Jugller settings
" ==============================================================================
                               
let g:LustyJugglerAltTabMode = 1
let g:LustyJugglerSuppressRubyWarning = 1
noremap <silent> <C-TAB> :LustyJuggler<CR>


" ==============================================================================
" Sparkup configuration
" ==============================================================================

let g:sparkupNextMapping = '<c-y>'


" ==============================================================================
" GUI
" ==============================================================================

" Shift Key
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif


" ==============================================================================
" Filetype specific handling
" ==============================================================================

if has("autocmd")
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif

