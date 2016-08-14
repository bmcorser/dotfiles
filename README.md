dotfiles
========

Like every good boy and girl, I have shared my config.

Let's go!
=========

To begin to use (assuming we have checked out to `$HOME`):

Ubuntu
------
Just use apt :smiley:

```shell
sudo apt-get install tmux
sudo apt-get install exuberant-ctags
gem install tmuxinator
```

Redhat
------
```
sudo yum install -y tmux cmake gcc-c++
```

Mac
---
Get Homebrew and brew away :beer:
```shell
brew install tmux
```

Install
-------
Let's get those submodules down (vundle and a powerline font):
```bash
cd ~/dotfiles/
git submodule init
git submodule update
```

Symlink files to expected places:
```bash
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
```

Delicious vim plugins:
```bash
vim +BundleInstall +qa

cd ~/.vim/bundle/YouCompleteMe
python install.py
```

Spare aliases are sitting in `env.sh` and need to be sourced at shell startup
by adding something like `source ~/dotfiles/env.sh` to the rc for whatever
shell we're chilling in.

