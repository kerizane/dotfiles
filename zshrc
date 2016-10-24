# Created by newuser for 5.0.2
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -e
