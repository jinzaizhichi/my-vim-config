if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi

fpath=(~/.config/zsh/zsh.d/comp $fpath)

autoload -Uz compinit
setopt EXTENDEDGLOB
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C
unsetopt EXTENDEDGLOB
