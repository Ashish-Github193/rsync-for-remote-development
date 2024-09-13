#!/bin/bash

# Define local and remote repository paths
LOCAL_REPO_PATH="$HOME/Projects/<project-name>" # Replace this path as needed
REMOTE_REPO_PATH="remote:/home/ubuntu/Projects/<project-name>" # Replace this path as needed
DRY="$1"

# Create a temporary exclude file from .gitignore
EXCLUDE_FILE=$(mktemp)
grep -v '^\s*#' "$LOCAL_REPO_PATH/.gitignore" | grep -v '^\s*$' > "$EXCLUDE_FILE"

# Show the exclude patterns being applied
echo "Excluding the following patterns:"
cat "$EXCLUDE_FILE"
echo "--------------------------------"

# Check if the dry-run argument is provided
if [ "$DRY" == "dry" ]; then
    echo "Running in dry-run mode..."
    # Run rsync in dry-run mode with excludes
    rsync -av --dry-run --exclude-from="$EXCLUDE_FILE" "$LOCAL_REPO_PATH/" "$REMOTE_REPO_PATH/"
else
    # Loop to keep syncing in the background with excludes
    while true; do
        echo "Starting rsync with excludes..."
        # Run rsync normally with excludes
        rsync -av --partial \
                  --delete \
                  --exclude-from="$EXCLUDE_FILE" "$LOCAL_REPO_PATH/" "$REMOTE_REPO_PATH/"

        echo "Rsync completed. Waiting for the next sync..."
    done
fi

# Clean up the temporary exclude file
echo "Cleaning up temporary exclude file..."
rm "$EXCLUDE_FILE"
