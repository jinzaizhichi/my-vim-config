if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

fpath=(~/myfns $fpath)

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit
