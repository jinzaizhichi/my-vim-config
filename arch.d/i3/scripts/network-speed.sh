#!/bin/sh

# Find active interface
iface=$(ip route | awk '/default/ {print $5; exit}')

if [ -z "$iface" ]; then
    echo "󰖪 --"
    exit 0
fi

# Get current bytes
rx1=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx1=$(cat /sys/class/net/$iface/statistics/tx_bytes)

sleep 1

rx2=$(cat /sys/class/net/$iface/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$iface/statistics/tx_bytes)

# Calculate speed in KB/s
rx_speed=$(( (rx2 - rx1) / 1024 ))
tx_speed=$(( (tx2 - tx1) / 1024 ))

# Format output
if [ $rx_speed -gt 1024 ]; then
    rx_fmt="$(echo "scale=1; $rx_speed/1024" | bc)M"
else
    rx_fmt="${rx_speed}K"
fi

if [ $tx_speed -gt 1024 ]; then
    tx_fmt="$(echo "scale=1; $tx_speed/1024" | bc)M"
else
    tx_fmt="${tx_speed}K"
fi

echo "󰁆 $rx_fmt 󰁞 $tx_fmt"
