#!/bin/bash
echo 'Grabbing sudo once, don’t pretend you don’t love it'
sudo echo 'Got sudo'


ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim

sudo apt install -y tmux git zsh cmake g++ python-dev

git submodule init
git submodule update

sudo cp ~/dotfiles/fonts/*.otf /usr/share/fonts/opentype/
sudo cp ~/dotfiles/fonts/*.ttf /usr/share/fonts/truetype/

vim +BundleInstall +qa
pushd ~/.vim/bundle/YouCompleteMe
./install.py
popd

chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
echo 'BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"' >> ~/.zshrc
base16_3024

echo 'source ~/dotfiles/env.sh' >> ~/.zhrc
