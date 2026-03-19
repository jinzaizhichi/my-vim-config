export KEYTIMEOUT=10

autoload -Uz edit-command-line

zle -N edit-command-line

bindkey -v
bindkey -M vicmd 'v' edit-command-line

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

function zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      echo -ne '\e[2 q\e]12;#79241f\a';;
        (main|viins) echo -ne '\e[2 q\e]12;#f8f7f2\a';;
    esac
}

function zle-line-init {
    echo -ne '\e[2 q\e]12;#f8f7f2\a'
}

zle -N zle-keymap-select
zle -N zle-line-init
