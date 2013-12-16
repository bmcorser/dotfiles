# aliases
alias rmpyc='find . -name "*.pyc" -exec rm {} \; && find . -name "*.orig" -exec rm {} \;'
alias cls='clear;echo "Currently logged in on $(tty), as ben in directory $(pwd)."'
alias t='tmux -2 -u'
alias l='ls -lash'
alias ack='ack-grep'
alias v=vim

alias gf='git fetch'
alias gbk='git checkout -'
alias gcd='git checkout develop'
alias ggpush!='git push origin $(current_branch) --force'
alias grc='git rebase --continue'
alias gmt='git mergetool'
alias govenv='cd $VIRTUAL_ENV/lib/python2.7/site-packages/'

# zsh env
export DISABLE_AUTO_TITLE=true
source ~/dotfiles/completion/tmuxinator.zsh
