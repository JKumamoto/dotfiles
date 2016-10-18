#!/bin/sh

dir=~/dotfiles
vim=~/.vim
mpd=~/.config/mpd

if [ -d "$vim" ]; then
	rm -r $vim/*
else
	mkdir -p $vim
fi

if [ -d "$mpd" ]; then
	rm -r $mpd/*
else
	mkdir -p $mpd
fi

cp $dir/.zshrc ~

echo "Updating vim files"
cp $dir/.vimrc ~
for file in $dir/vim_conf; do
	cp -r $file $vim
done

echo "Updating mpd files"
for file in $dir/mpd; do
	cp -r $file $mpd
done


