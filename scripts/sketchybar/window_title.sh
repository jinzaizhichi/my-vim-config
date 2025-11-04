#!/bin/bash

WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title' | cut -c1-50)

if [ "$WINDOW_TITLE" = "null" ]; then
    WINDOW_TITLE=""
fi

sketchybar --set $NAME label="$WINDOW_TITLE"
