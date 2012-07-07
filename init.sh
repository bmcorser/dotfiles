#!/bin/bash


mv ~/.bashrc ~/.bashrc.old && ln -s bashrc ~/.bashrc
mv ~/.fonts ~/.fonts.old && ln -s fonts ~/.fonts
mv ~/.gitconfig ~/.gitconfig.old && ln -s gitconfig ~/.gitconfig
mv ~/.vim ~/.vim.old && ln -s vim ~/.vim
mv ~/.vimrc ~/.vimrc.old && ln -s vimrc ~/.vimrc
mv ~/.Xmodmap ~/.Xmodmap.old && ln -s Xmodmap ~/.Xmodmap

vim +BundleInstall +qa
