#!/bin/bash

en="$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')"
SSID=$(ipconfig getsummary "$en" | grep -Fxq "  Active : FALSE" || networksetup -listpreferredwirelessnetworks "$en" | sed -n '2s/^\t//p')

if [ -z "$SSID" ]; then
  sketchybar --set "$NAME" label="Disconnected" icon.color=0xffff0000
else
  sketchybar --set "$NAME" label="$SSID" icon.color=0xffffffff
fi
