[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
is_arch="${cat /proc/version | grep -c ARCH}"

# Exports
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"

#Aliases
alias se="sudoedit"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

if [ $is_arch ]; then
	alias off='shutdown now'
	alias sleep='systemctl hybrid-sleep'
	alias pacup='sudo pacman -Syu'
	alias pacin='sudo pacman -Su'
fi
