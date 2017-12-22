#!/bin/sh

dir=$(pwd)
vim=~/.vim
mpd=~/.config/mpd
i3wm=~/.config/i3
echo $dir

if [ -d "$vim" ]; then
	rm -r $vim/*
else
	mkdir -p $vim
fi

if [ -d "$i3wm" ]; then
	rm -r $i3wm/*
else
	mkdir -p $i3wm
fi

cp $dir/zshrc ~/.zshrc

echo "Updating vim files"
cp $dir/vimrc ~/.vimrc
for file in $dir/vim; do
	cp -r $file $vim
done

for file in $dir/i3; do
	cp -r $file $i3wm
done

