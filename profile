[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
is_arch="$(cat /proc/version | grep -c ARCH)"

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh


# Exports
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/mytools/arcanist/bin/:$PATH"
export PATH="$HOME/pycharm-community-2017.3.2/bin/:$PATH"
export PATH="/space/git/devtools/bin/:$PATH"
export PATH="/space/git/devtools/arcanist/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="/space/git/PROJ-MultiOp/feeds/mapping_tools/:$PATH"

export KUBECONFIG=/space/git/devtools/deploy/config/kubeconfig/config  


export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=xterm-256color

export GIT_COMPLETION_CHECKOUT_NO_GUESS=1


#Aliases
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias la="ls -a"
alias lal="ls -al"
alias ll="ls -l"
alias lla="ls -al"
alias nr="sudo nginx -s reload"
alias nt="sudo nginx -t"
alias pa="ps aux"
alias pag="ps aux | grep"
alias pav="ps aux | vim -"
alias pls="sudo !!"
alias se="sudoedit"
alias sudo="sudo "
alias v="vim"
alias G="| grep"
alias V="| vim -"

alias mc="make check"
alias ms="make shell"
alias ml="make lint"

# ----------------------
# Git Aliases
# ----------------------
alias g="git"
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'

alias gb='git branch'
alias gbd='git branch --delete '

alias gc='git commit'
alias gca='git commit --amend'
alias gcf='git commit --fixup'
alias gcm='git commit --message'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcp='git cherry-pick'

alias gd='git diff'
alias gda='git diff HEAD'

alias gg='git grep'

alias gi='git init'

alias gl='git log'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias glg='git log --graph --oneline --decorate --all'

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

alias gp='git pull'
alias gpr='git pull --rebase'

alias gpu='git push'

alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'

alias gs='git status'
alias gss='git status --short'

alias gsh='git show'

alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

if [ $is_arch ]; then
	alias off='shutdown now'
	alias sleep='systemctl hybrid-sleep'
	alias pacup='sudo pacman -Syu'
	alias pacin='sudo pacman -Su'
fi

function gfind() {
	grep -rnw . -e "$1"
}

function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

test -f /space/git/git/contrib/completion/git-completion.bash && . $_

source ~/.geneity_paths

if [ "$TERM" != "linux" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

