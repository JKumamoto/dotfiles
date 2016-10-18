#!/bin/sh

dir=~/dotfiles
vim=~/.vim
mpd=~/.config/mpd

cp ~/.zshrc $dir

echo "Updating vim files"
cp ~/.vimrc $dir
cp -r $vim/*.vim $dir/vim_conf
cp -r $vim/autoload $dir/vim_conf
cp -r $vim/colors $dir/vim_conf
cp -r $vim/spell $dir/vim_conf

