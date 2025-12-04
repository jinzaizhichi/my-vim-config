if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

fpath=(~/.config/zsh/zsh.d/comp $fpath)

autoload -Uz compinit
compinit
