#!/bin/sh

dir=$(pwd)
vim=~/.vim
mpd=~/.config/mpd

cp ~/.zshrc $dir/zshrc

echo "Updating vim files"
cp ~/.vimrc ./vimrc
mkdir -p ./vim
cp $vim/*.vim ./vim
cp -r $vim/autoload ./vim
cp -r $vim/colors ./vim
cp -r $vim/spell ./vim



