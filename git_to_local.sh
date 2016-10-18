#!/bin/sh

dir=~/dotfiles
vim=~/.vim
mpd=~/.config/mpd

if [ -d "$vim" ]; then
	rm -r $vim/*
else
	mkdir -p $vim
fi

cp $dir/.zshrc ~

echo "Updating vim files"
cp $dir/.vimrc ~
for file in $dir/vim_conf; do
	cp -r $file $vim
done

