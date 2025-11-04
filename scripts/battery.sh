#!/bin/bash

BATTERY_PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [[ $CHARGING != "" ]]; then
    sketchybar --set $NAME label="${BATTERY_PERCENTAGE}%+"
else
    sketchybar --set $NAME label="${BATTERY_PERCENTAGE}%"
fi
