# functions
function confirm {
echo "$(current_branch) -> origin/$(current_branch) .. really?"

    read -rs -k 1 ans

    case "${ans}" in
    y|Y|$'\n')
        printf "Yes\n"
            return 0
        ;;

    *)  # This is the default
        printf "No\n"
            return 1

    esac

}

# aliases
alias rmpyc='find . -name "*.pyc" -exec rm {} \; && find . -name "*.orig" -exec rm {} \;'
alias cls='clear;echo "Currently logged in on $(tty), as ben in directory $(pwd)."'
alias t='tmux -2u'
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
alias ggpull='git pull --ff-only origin $(current_branch)'
alias gro='confirm && git reset --hard origin/$(current_branch)'

# zsh env
export DISABLE_AUTO_TITLE=true
xmodmap ~/dotfiles/Xmodmap
