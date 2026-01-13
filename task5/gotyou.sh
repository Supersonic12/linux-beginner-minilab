#!/bin/bash

# Set the threshold for disk usage (in percentage)
THRESHOLD=80

# Get the disk usage percentage
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "Warning: Disk usage is over $THRESHOLD%. Current usage is $USAGE%."
else
  echo "Disk usage is under control. Current usage is $USAGE%."
fi

