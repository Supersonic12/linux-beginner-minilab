#!/bin/bash

# Define the file, search string, and replace string
FILE="$1"
SEARCH="$2"
REPLACE="$3"

# Check if the file and strings are provided
if [ -z "$FILE" ] || [ -z "$SEARCH" ] || [ -z "$REPLACE" ]; then
  echo "Usage: $0 <file> <search_string> <replace_string>"
  exit 1
fi

# Perform the search and replace
sed -i "s/$SEARCH/$REPLACE/g" "$FILE"

# Check if the replacement was successful
if [ $? -eq 0 ]; then
  echo "Replaced '$SEARCH' with '$REPLACE' in $FILE"
else
  echo "Failed to replace text!"
fi

