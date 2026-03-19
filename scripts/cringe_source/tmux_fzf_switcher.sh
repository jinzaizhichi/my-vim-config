#!/bin/bash

{
  tmux list-sessions -F 'session: #{session_name} (#{session_windows} windows)'
  tmux list-windows -a -F 'window: #{session_name}:#{window_index} - #{window_name} (#{window_panes} panes)'
} | fzf \
  --prompt='Senpai-kun, search your tmux processes> ' \
  --header='Enter=switch | Type to filter sessions or windows' \
  --preview='
    target=$(echo {} | sed -e "s/^session: //" -e "s/^window: //" -e "s/ -.*$//" -e "s/ (.*$//" -e "s/:$/:/")
    if [[ {} == session:* ]]; then
      # Preview session: show first window
      tmux capture-pane -ep -t "$target":
    else
      # Preview window: show actual terminal content
      tmux capture-pane -ep -t "$target"
    fi
  ' \
  --preview-window=right:50%:wrap | \
  sed -e 's/^session: //' -e 's/^window: //' -e 's/ -.*$//' -e 's/ (.*$//' | \
  xargs -r tmux switch-client -t
