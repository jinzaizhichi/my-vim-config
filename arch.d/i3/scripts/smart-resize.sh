#!/bin/bash

read x y w h<<<$(i3-msg -t get_tree|jq -r '..?|select(.focused? and .window?)|"\(.rect.x) \(.rect.y) \(.rect.width) \(.rect.height)"'|head -1)

read X Y W H<<<$(i3-msg -t get_workspaces|jq -r '.[]|select(.focused)|"\(.rect.x) \(.rect.y) \(.rect.width) \(.rect.height)"')
R=$((x-X+w/2>W/2));B=$((y-Y+h/2>H/2))

case $1 in
  h)((R))&&i3-msg resize grow width 20 px||i3-msg resize shrink width 20 px;;
  l)((R))&&i3-msg resize shrink width 20 px||i3-msg resize grow width 20 px;;
  k)((B))&&i3-msg resize grow height 20 px||i3-msg resize shrink height 20 px;;
  j)((B))&&i3-msg resize shrink height 20 px||i3-msg resize grow height 20 px;;
esac
