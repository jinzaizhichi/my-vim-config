if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
fi

fpath=(~/.config/zsh/zsh.d/comp ${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C
