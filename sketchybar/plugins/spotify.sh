#!/bin/bash

# Check if Spotify is running
if ! pgrep -x "Spotify" > /dev/null; then
    sketchybar --set "$NAME" drawing=off
    exit 0
fi

# Get Spotify state
STATE=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)

if [[ "$STATE" == "playing" ]]; then
    TRACK=$(osascript -e 'tell application "Spotify" to name of current track' 2>/dev/null)
    ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track' 2>/dev/null)

    if [[ -n "$TRACK" ]] && [[ -n "$ARTIST" ]]; then
        # Truncate if too long
        LABEL="$ARTIST - $TRACK"
        if [[ ${#LABEL} -gt 40 ]]; then
            LABEL="${LABEL:0:37}..."
        fi
        sketchybar --set "$NAME" label="$LABEL" drawing=on
    else
        sketchybar --set "$NAME" drawing=off
    fi
else
    sketchybar --set "$NAME" drawing=off
fi
