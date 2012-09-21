#!/bin/sh

installpath="$HOME/.minuteman3.vimfiles"

echo "Backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done

echo "Cloning the repo to $installpath\n"
git clone https://github.com/minuteman3/vimfiles.git $installpath

ln -s $installpath $HOME/.vim
ln -s $installpath/vimrc $HOME/.vimrc
mkdir $installpath/bundle

echo "Fetching Vundle"
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
echo "Installing bundles"
vim +BundleInstall +BundleClean +qall
