#!/bin/sh

# Check if spotify/spotifyd is running
if pgrep -x "spotify" > /dev/null || pgrep -x "spotifyd" > /dev/null; then
    # Try playerctl first
    if command -v playerctl > /dev/null 2>&1; then
        status=$(playerctl -p spotify status 2>/dev/null || playerctl -p spotifyd status 2>/dev/null)
        if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
            artist=$(playerctl -p spotify metadata artist 2>/dev/null || playerctl -p spotifyd metadata artist 2>/dev/null)
            title=$(playerctl -p spotify metadata title 2>/dev/null || playerctl -p spotifyd metadata title 2>/dev/null)

            # Truncate if too long
            display="$artist - $title"
            if [ ${#display} -gt 40 ]; then
                display=$(echo "$display" | cut -c1-40)...
            fi

            if [ "$status" = "Playing" ]; then
                echo " $display"
            else
                echo " $display"
            fi
        fi
    fi
fi
