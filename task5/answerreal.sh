#!/bin/bash

# Define source and destination directories
SOURCE_DIR="$1"
DEST_DIR="$2"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_$DATE.tar.gz"

# Check if source and destination directories are provided
if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
  echo "Usage: $0 <source_directory> <destination_directory>"
  exit 1
fi

# Create a backup using tar
tar -czf "$DEST_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup created successfully: $DEST_DIR/$BACKUP_NAME"
else
  echo "Backup failed!"
fi

