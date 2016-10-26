[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
is_arch="$(cat /proc/version | grep -c ARCH)"

# Exports
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"

#Aliases
alias g="git"
alias se="sudoedit"
alias ll="ls -l"
alias la="ls -a"
alias lal="ls -al"
alias lla="ls -al"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias sudo="sudo "
alias pls="sudo !!"
alias nr="sudo nginx -s reload"
alias nt="sudo nginx -t"

if [ $is_arch ]; then
alias off='shutdown now'
alias sleep='systemctl hybrid-sleep'
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -Su'
fi

#Functions
# function cd() {
# 	new_directory="$*";
# 	if [ $# -eq 0 ]; then 
# 		new_directory=${HOME};
# 	fi;
# 	builtin cd "${new_directory}" && ls
# }
