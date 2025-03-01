#!/bin/bash

# Script to kill processes running on a specified port
# Special handling for nodemon processes that automatically restart

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

# Check if any of the processes are nodemon
for process_pid in $pid; do
    process_name=$(ps -p $process_pid -o comm=)
    parent_pid=$(ps -p $process_pid -o ppid=)
    parent_name=$(ps -p $parent_pid -o comm=)

    if [[ "$process_name" == *"node"* && ("$parent_name" == *"nodemon"* || "$process_name" == *"nodemon"*) ]]; then
        echo "Detected nodemon process on port $port"

        # Find the nodemon parent process
        while [[ "$parent_name" != *"nodemon"* && "$parent_pid" != "1" ]]; do
            process_pid=$parent_pid
            parent_pid=$(ps -p $process_pid -o ppid=)
            parent_name=$(ps -p $parent_pid -o comm=)

            if [[ "$process_name" == *"nodemon"* ]]; then
                break
            fi
        done

        # Kill the nodemon process and all its children
        echo "Killing nodemon process tree with PID: $process_pid"
        pkill -P $process_pid
        kill -9 $process_pid

        # Also kill the original node process just to be sure
        echo "Also killing node process on port $port"
        lsof -ti:$port | xargs kill -9

        echo "Nodemon and its child processes have been terminated."
        exit 0
    fi
done

# For non-nodemon processes, kill them directly
echo "Killing process(es) on port $port with PID(s): $pid"
kill -9 $pid

echo "Process(es) successfully terminated."
