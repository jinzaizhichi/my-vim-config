export KEYTIMEOUT=1

autoload -Uz add-zsh-hook
autoload -Uz edit-command-line

zle -N edit-command-line

bindkey -v
bindkey -M vicmd 'v' edit-command-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

function zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      echo -ne '\e[1 q';;
        (main|viins) echo -ne '\e[5 q';;
    esac
}

zle -N zle-keymap-select
