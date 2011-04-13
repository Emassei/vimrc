 
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
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
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
"set virtualedit=all             " allow the cursor to go in to invalid places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·,eol:¬

" regex fix
nnoremap / /\v
vnoremap / /\v

" folding settings
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ==============================================================================
" Editor layout
" ==============================================================================

set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in
set ch=2                        " Make command line two lines high
if has('statusline')
    set statusline=%<%f\   " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)  " Right aligned file nav info
endif


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
" PHP settings
" ==============================================================================

let php_sql_query=1
let php_htmlInStrings=1
let php_folding=1
let php_parent_error_close=1
let php_parent_error_open=1

" ctrl-p to comment php code
inoremap <silent> <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <silent> <C-P> :call PhpDocSingle()<CR>
vnoremap <silent> <C-P> :call PhpDocRange()<CR> 

" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
function! LoadTags(file)
   let tagspath = $HOME . "/.vim.tags/" . a:file
   let tagcommand = 'set tags+=' . tagspath
   execute tagcommand
endfunction
command! -nargs=1 Ltag :call LoadTags("<args>")

" Load a project : change directory - load tags - show nerdtree
function! LoadProject(name)
    let projectpath = "/Library/Webserver/Documents/" . a:name
    let cdcommand = 'cd ' . projectpath
    execute cdcommand
    call LoadTags(a:name)
    NERDTree
endfunction
command! -nargs=1 Project : call LoadProject("<args>")

" ==============================================================================
" Shortcut mappings
" ==============================================================================

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" Show current tag for word under the cursor
nnoremap <silent> <leader>t <C-]>
nnoremap <silent> <leader>st <C-w><C-]>
" Show current tag list for word under the cursor
nnoremap <silent> <leader>tj g<C-]>
nnoremap <silent> <leader>stj <C-w>g<C-]>

" Open omnicomplete menu
inoremap <silent> <C-space> <C-x><C-o>

" Quickly close the current window
nnoremap <silent> <leader>q :q<CR>

" Use the damn hjkl keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

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

" Open file in current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <silent> <leader>ew :e %%
map <silent> <leader>es :vsp %%
" Change directory to directory of current file
map <silent> <leader>cd :cd %% <CR>

" Expand to local webserver root
cnoremap ## <C-R>='/Library/Webserver/Documents/'<cr>

" Clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcut to rapidly toggle hidden caracters
nmap <silent> <leader>h :set list!<CR>

" Strip all trailing whitespace from a file, using ,w
nnoremap <silent> <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Run Ack fast
nnoremap <silent> <leader>a :Ack<Space>

" Convert markdown to html
nmap <silent> <leader>md :%!/usr/local/bin/markdown<CR>

" Preview file in safari
map <silent> <leader>s :!open -a Safari %<CR><CR>

" surround with strong or em tags
map <silent> <leader>b lbi<strong><Esc>ea</strong><Esc>
map <silent> <leader>i lbi<em><Esc>ea</em><Esc>

" space as pagedown like web browser 
nmap <space> <pagedown>


" ==============================================================================
" Abreviations
" ==============================================================================

ab GG Gunther Groenewege
ab "= " ==============================================================================


" ==============================================================================
" NERDTree settings
" ==============================================================================

let NERDChristmasTree=1
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
nmap <silent> <leader>n :NERDTreeToggle<CR>
nmap <silent> <leader>N :NERDTreeClose<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>


" ==============================================================================
" Taglist settings
" ==============================================================================

nmap <silent> <leader>l :TlistToggle<CR>
nmap <silent> <leader>L :TlistClose<CR>
" TagListTagName - Used for tag names
highlight MyTagListTagName gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fild_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let tlist_php_settings = 'php;c:class;f:Functions'


" ============================================================================== 
" Snipmate settings
" ============================================================================== 

let g:snips_author = 'Gunther Groenewege' 
let g:snippets_dir = $HOME . "/.vim/snippets/"
" Use HTML and PHP snippets in .php files
nmap <silent> <leader>ph :set filetype=php.html<CR>
" Shortcut for reloading snippets, useful when developing
nnoremap <silent> <leader>r <esc>:exec ReloadAllSnippets()<cr>


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

