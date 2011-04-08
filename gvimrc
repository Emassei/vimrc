if has("gui_macvim")
    " Fullscreen takes up entire screen
    set fuoptions=maxhorz,maxvert

    " Command-T for Peepopen
    macmenu &File.New\ Tab key=<D-T>
    map <D-t> <Plug>PeepOpen

    " Command-Option-ArrowKey to switch viewports
    map <D-M-Up> <C-w>k
    imap <D-M-Up> <Esc> <C-w>k
    map <D-M-Down> <C-w>j
    imap <D-M-Down> <Esc> <C-w>j
    map <D-M-Right> <C-w>l
    imap <D-M-Right> <Esc> <C-w>l
    map <D-M-Left> <C-w>h
    imap <D-M-Left> <C-w>h

    " Emulate Textmate's shift left/right command
    nmap <D-[> <<
    nmap <D-]> >>
    vmap <D-[> <gv
    vmap <D-]> >gv
  
endif

set guioptions=aAce

" Do not display Toolbar or menus
set go-=T
set go-=m

" Font
set guifont=PanicSans:h13
