export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --border=none
  --preview-border=none
  --input-border=none
  --height=100%
"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --theme=ansi {} 2>/dev/null || cat {}'
"
export FZF_CTRL_R_OPTS="
  --no-preview
"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="
  --preview 'ls -la {}'
"
