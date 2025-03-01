#!/bin/bash

# Script to kill processes running on a specified port

# Prompt the user for the port number
echo -n "Enter the port number to kill: "
read port

# Check if the input is a valid number
if ! [[ "$port" =~ ^[0-9]+$ ]]; then
    echo "Error: Port must be a number."
    exit 1
fi

# Find processes running on the specified port
pid=$(lsof -ti:$port)

# Check if any processes were found
if [ -z "$pid" ]; then
    echo "No processes found running on port $port."
    exit 0
fi

# Kill the processes
echo "Killing process(es) on port $port with PID(s): $pid"
kill -9 $pid

echo "Process(es) successfully terminated."
