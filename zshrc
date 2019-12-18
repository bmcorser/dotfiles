# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=100000
setopt appendhistory
unsetopt beep nomatch
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/ben/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/dotfiles/gitalias
source ~/dotfiles/extraalias
PROMPT='%D{%Y%m%d %H%M} 🌆 '
