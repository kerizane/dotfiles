# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.profile

#Aliases
alias se="sudoedit"

# Exports
export VISUAL=vim
export EDITOR="$VISUAL"
