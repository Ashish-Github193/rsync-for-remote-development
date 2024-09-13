#!/bin/bash

echo "Starting sync.sh"
chmod +x sync/*.sh

# Start the sync.sh script in the background and redirect both stdout and stderr to sync.log
sync/sync.sh >> sync/sync.log 2>&1 &

# Get the PID of the last background command
PID=$!

echo "sync.sh started with PID $PID"
echo "Exiting"
