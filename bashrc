# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /etc/bash_completion.d/ ]; then
	. /etc/bash_completion.d/
fi

source ~/.profile
export HISTCONTROL=ignoredups
