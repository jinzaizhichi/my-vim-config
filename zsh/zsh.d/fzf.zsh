local FZF_LAYOUT

if [[ -n "$TMUX" ]]; then
  FZF_LAYOUT="--tmux=100%"
else
  FZF_LAYOUT="--height=100%"
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="
  ${FZF_LAYOUT}
  --style=minimal
  --layout=default
  --prompt='❯ '
  --pointer='▶'
  --marker='!'
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat --style=auto --color=always {}"'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

source <(fzf --zsh)

bindkey -r '^T'
bindkey -r '^G'
bindkey '^O' fzf-file-widget

source "$HOME/bin/fzf-git.sh/fzf-git.sh"
source "$HOME/bin/fzf-clipboard.sh/fzf-clipboard.zsh"

stty -ixon

alias fssh="$HOME/bin/fzf-ssh.sh/ssh.fzf"
