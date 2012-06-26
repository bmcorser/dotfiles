#!/bin/bash


ln -s dotfiles/bashrc ~/.bashrc -f
ln -s dotfiles/fonts ~/.fonts -f
ln -s dotfiles/gitconfig ~/.gitconfig -f
ln -s dotfiles/vim ~/.vim -f
ln -s dotfiles/vimrc ~/.vimrc -f
ln -s dotfiles/Xmodmap ~/.Xmodmap -f

vim +BundleInstall +qa
