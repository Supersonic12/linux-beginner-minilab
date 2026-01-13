#!/bin/bash

# Default password length
PASSWORD_LENGTH=12

# Check if a length is provided as an argument
if [ ! -z "$1" ]; then
  PASSWORD_LENGTH=$1
fi

# Generate a random password using /dev/urandom
PASSWORD=$(< /dev/urandom tr -dc 'A-Za-z0-9_!@#$%^&*' | head -c $PASSWORD_LENGTH)

# Output the generated password
echo "Your generated password is: $PASSWORD"

