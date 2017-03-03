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
alias tmux='tmux -2u'
alias l='ls -lash'
alias ack='ack-grep'
alias v=vim

alias gf='git fetch'
alias gbk='git checkout -'
alias gcd='git checkout develop'
alias ggpush='git push origin $(current_branch)'
alias ggpush!='git push origin $(current_branch) --force'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gmt='git mergetool'
alias govenv='cd $VIRTUAL_ENV/lib/python2.7/site-packages/'
alias ggpull='git pull --ff-only origin $(current_branch)'
alias gro='confirm && git reset --hard origin/$(current_branch)'
alias grbo='git fetch && confirm && git rebase origin/$(current_branch)'
alias gst='git status -sb'

# zsh env
export DISABLE_AUTO_TITLE=true
xmodmap ~/dotfiles/Xmodmap &> /dev/null
# unsetopt nomatch # no glob
# bindkey -v
bindkey -M viins 'jk' vi-cmd-mode # closer esc
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
export GOPATH=~/.gopkgs
source ~/.pyenv/versions/2.7.8/bin/tmuxp.zsh &> /dev/null
tmuxp load services.yaml -2 -d &> /dev/null
# python /home/ben/dotfiles/days.py

# pushd /home/ben/writing/_bmcorser.github.io/blog/2015/12/01 > /dev/null
# ./fx_fdx/target/debug/fx_fdx
# popd > /dev/null
