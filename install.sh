#!/bin/sh

echo "Fetching Vundle"
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
echo "Installing bundles"
vim +BundleInstall +BundleClean +qall
