#!/bin/bash

# Toggle script - handles the prefix + ctrl + t logic

if ~/.scripts/tmux_timer.sh is_running; then
  # Timer is running - open log popup
  ~/.scripts/tmux_timer_log.sh
else
  # No timer - start it
  ~/.scripts/tmux_timer.sh start
  tmux display-message "Timer started!"
fi
