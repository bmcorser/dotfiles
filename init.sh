#!/bin/bash


mv ~/.bashrc ~/.bashrc.old && ln -s dotfiles/bashrc ~/.bashrc
mv ~/.fonts ~/.fonts.old && ln -s dotfiles/fonts ~/.fonts
mv ~/.gitconfig ~/.gitconfig.old && ln -s dotfiles/gitconfig ~/.gitconfig
mv ~/.vim ~/.vim.old && ln -s dotfiles/vim ~/.vim
mv ~/.vimrc ~/.vimrc.old && ln -s dotfiles/vimrc ~/.vimrc
mv ~/.Xmodmap ~/.Xmodmap.old && ln -s dotfiles/Xmodmap ~/.Xmodmap

vim +BundleInstall +qa
