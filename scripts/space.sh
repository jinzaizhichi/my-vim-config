#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

if [ "$SELECTED" = "true" ]; then
  sketchybar --set $NAME background.color=0xffdcc8d8 \
                         icon.color=$BLACK \
                         label.color=$BLACK
else
  sketchybar --set $NAME background.color=$ITEM_BG_COLOR \
                         icon.color=$WHITE \
                         label.color=$WHITE
fi
