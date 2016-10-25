# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.profile

alias off='shutdown now'
alias sleep='systemctl hybrid-sleep'
