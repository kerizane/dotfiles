# Created by newuser for 5.0.2
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'


# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
autoload -Uz compinit && compinit
# Autocomplete for 'g' as well
# complete -o default -o nospace -F _git g
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey -e
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

setopt HIST_IGNORE_DUPS
