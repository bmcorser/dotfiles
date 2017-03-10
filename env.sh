# aliases
alias rmpyc='find . -name "*.pyc" -exec rm {} \; && find . -name "*.orig" -exec rm {} \;'
alias cls='clear;echo "Currently logged in on $(tty), as $USER in directory $(pwd)."'
alias t='tmux -2 -u'
alias l='ls -lash'

alias gf='git fetch'
alias gbk='git checkout -'
alias gcd='git checkout develop'
alias ggpush!='git push origin $(current_branch) --force'
alias grc='git rebase --continue'
alias gmt='git mergetool'
setxkbmap -option caps:ctrl_modifier
