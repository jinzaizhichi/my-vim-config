if (( ${+commands[tmux]} )) && [[ ! -v TMUX && ! -v SSH_TTY && $EUID != 0 ]]; then
  [[ -v NO_TMUX ]] && return 0
  if [[ $(tmux list-sessions 2>/dev/null) ]]; then
    local sessions selection
    sessions=$(tmux list-sessions -F '#{session_last_attached}|#{session_name} (#{session_windows} windows)' \
      | sort -t'|' -k1 -rn | cut -d'|' -f2-)
    if [[ $(echo "$sessions" | wc -l) -eq 1 ]]; then
      tmux attach-session -t "${sessions% \(*}"
      return
    fi
    selection=$(echo "$sessions" | fzf \
      --prompt='choose session> ' \
      --height=~8 \
      --layout=reverse \
      --no-preview)
    [[ -z "$selection" ]] && return 0
    tmux attach-session -t "${selection% \(*}"
  else
    exec tmux new-session
  fi
fi
