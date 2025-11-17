export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --color=fg:4,bg:-1,hl:2
  --color=fg+:6,bg+:-1,hl+:2
  --color=info:8,prompt:3,pointer:6
  --color=marker:2,spinner:8,header:8
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
