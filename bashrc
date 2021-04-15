# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export HISTSIZE=1000000
export HISTFILESIZE=1000000
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

alias "cd.."="cd .."
alias "ös"="ls"
alias "l"="ls"
alias "s"="ls"
alias "gut"="git"

alias gs="git status"
alias ga="git add"
alias gp="git add -p"
alias gd="git diff"
alias gdc="git diff --cached"
alias gc="git commit"
alias gl="git log --all --decorate --oneline --graph"
alias gch="git checkout"
alias gm="git merge"
alias gpl="git pull"
alias gps="git push"

if [ -f "$HOME/.repos/pasoconfig/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.repos/pasoconfig/bash-git-prompt/gitprompt.sh
fi

export EDITOR=vim
if [[ -x "$(command -v vimx)" ]]; then alias vim='vimx'; fi

alias acq="ack -Q"

export LESS=-ARrSs

# export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config
# source <(kubectl completion bash)

export QT_LOGGING_RULES='*=false'

