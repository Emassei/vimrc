#!/bin/sh

die() {
    warn "$1"
    exit 1
}

[ -e "~/.gvimrc" ] && die "~/.gvimrc already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

cd ..
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc

