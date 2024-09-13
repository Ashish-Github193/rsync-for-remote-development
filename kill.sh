#!/bin/bash

echo "Killing sync.sh"
ps aux | grep "[s]ync/sync.sh"

# Get the PIDs of sync/sync.sh processes
PIDS=$(ps aux | grep "[s]ync/sync.sh" | awk '{print $2}')

# Check if any PIDs were found
if [ -z "$PIDS" ]; then
    echo "No running sync.sh processes found."
else
    echo "Running PIDs for sync.sh:"
    echo "$PIDS"

    # Kill the processes
    echo "Stopping sync.sh processes..."
    kill $PIDS
    echo "Processes stopped."
fi
