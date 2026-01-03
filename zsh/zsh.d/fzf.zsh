export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='
  --height=80%
  --info=inline-right
  --prompt="❯ "
  --pointer="▶ "
  --marker="! "
'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat --style=auto --theme=ansi --color=always {}"'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

bindkey -r '^T'
bindkey '^O' fzf-file-widget
