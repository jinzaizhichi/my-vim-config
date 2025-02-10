#!/bin/bash

SESSION_NAME="QuizMeSenpai"

CLIENT_PATH="~/Repositories/personal/QuizMeSenpai/client/"
SERVER_PATH="~/Repositories/personal/QuizMeSenpai/api/"

SESSION_EXISTS=$(tmux list-sessions | grep $SESSION_NAME)

if [ "$SESSION_EXISTS" = "" ]
then
  # Start new session
  tmux new-session -d -s $SESSION_NAME

  # Client project setup on first window
  tmux rename-window -t 0 "client"
  tmux send-keys -t "client" "cd $CLIENT_PATH && clear && vim" C-m

  # Server project setup on second window
  tmux new-window -t $SESSION_NAME:1 -n "server"
  tmux send-keys -t "server" "cd $SERVER_PATH && clear && vim" C-m

  # Setup dev env on third window
  tmux new-window -t $SESSION_NAME:2 -n "dev env"
  tmux split-window -h
  tmux split-window -v
  tmux select-pane -t 0
  tmux split-window -v
  tmux select-pane -t 0
  tmux send-keys -t 0 "cd $CLIENT_PATH && clear" C-m
  tmux select-pane -t 1
  tmux send-keys -t 1 "cd $CLIENT_PATH && clear" C-m
  tmux select-pane -t 2
  tmux send-keys -t 2 "cd $SERVER_PATH && clear" C-m
  tmux select-pane -t 3
  tmux send-keys -t 3 "cd $SERVER_PATH && clear" C-m
fi

tmux attach -t $SESSION_NAME
