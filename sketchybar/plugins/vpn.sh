#!/bin/bash

MULLVAD_CMD="/usr/local/bin/mullvad"

# Check if mullvad CLI is available
if [[ ! -f "$MULLVAD_CMD" ]]; then
    sketchybar --set $NAME label="N/A"
    exit 0
fi

# Get Mullvad status
STATUS=$($MULLVAD_CMD status 2>/dev/null)

if echo "$STATUS" | grep -q "Connected"; then
    # Extract location from "Visible location: Country, City"
    LOCATION=$(echo "$STATUS" | grep "Visible location:" | sed 's/.*Visible location:[[:space:]]*//' | cut -d',' -f2 | sed 's/^[[:space:]]*//' | cut -d'.' -f1)
    if [[ -n "$LOCATION" ]]; then
        sketchybar --set "$NAME" label="$LOCATION" icon.color=0xff00ff00
    else
        sketchybar --set "$NAME" label="ON" icon.color=0xff00ff00
    fi
else
    sketchybar --set "$NAME" label="OFF" icon.color=0xffff0000
fi
