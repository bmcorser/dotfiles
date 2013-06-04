dotfiles
========

like every good boy and girl, i have shared my config

let's go
========

to begin to use (assuming we have checked out to `$HOME`):

```shell
cd ~/dotfiles/
git submodule init
git submodule update

ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim

vim +BundleInstall +qa
```

aliases are sitting in `alias` and need to be sourced at shell startup by
adding something like `source ~/dotfiles/alias` to the rc for whatever shell
we're chilling in

we might also need some delightful small free applications:

```shell
sudo apt-get install tmux
sudo apt-get install exuberant-ctags
```
