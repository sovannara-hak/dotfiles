#!/bin/sh

if ! `test x$(basename $(pwd)) = x.dotfiles`; then
 echo "please run ./setup.sh from .dotfiles directory"
 exit 1
fi

dotfiles=`find . -maxdepth 1 -type f -and -name '.*'`
for i in $dotfiles; do
    fname=`basename $i`
    echo "Creating symbolic link: $HOME/$fname"
    ln -sf .dotfiles/$fname $HOME/$fname
done

echo "Creating symbolic link: $HOME/.vim"
ln -sf .dotfiles/vim-config $HOME/.vim
echo "Creating symbolic link: $HOME/.vimrc"
ln -sf .dotfiles/vim-config/_vimrc $HOME/.vimrc
echo "Creating symbolic link: $HOME/.gvimrc"
ln -sf .dotfiles/vim-config/_gvimrc $HOME/.gvimrc

echo "Creating symbolic link: $HOME/.mpv"
ln -sf .dotfiles/mpv $HOME/.mpv
