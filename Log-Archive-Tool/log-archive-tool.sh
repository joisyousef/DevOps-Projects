#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# Get the log directory from the argument
LOG_DIR=$1

# Check if the provided directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Create a new directory for storing archived logs
ARCHIVE_DIR="$LOG_DIR/archives"
mkdir -p "$ARCHIVE_DIR"

# Get the current date and time for the archive name
CURRENT_TIME=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${CURRENT_TIME}.tar.gz"

# Compress the logs and store them in the new directory
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

# Log the date and time of the archive
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "Archived on: $(date +"%Y-%m-%d %H:%M:%S")" >> "$LOG_FILE"

# Output the success message
echo "Logs have been archived successfully to '$ARCHIVE_DIR/$ARCHIVE_NAME'."
