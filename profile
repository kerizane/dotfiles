[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
is_arch="$(cat /proc/version | grep -c ARCH)"

[[ -s /home/keri/.autojump/etc/profile.d/autojump.sh ]] && source /home/keri/.autojump/etc/profile.d/autojump.sh

# Exports
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=xterm-256color

#Aliases
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias g="git"
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
alias V="| vim"

if [ $is_arch ]; then
alias off='shutdown now'
alias sleep='systemctl hybrid-sleep'
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -Su'
fi

#Functions
#
# function cd() {
# 	new_directory="$*";
# 	if [ $# -eq 0 ]; then 
# 		new_directory=${HOME};
# 	fi;
# 	builtin cd "${new_directory}" && ls
# }

function gfind() {
	grep -rnw . -e "$1"
}

