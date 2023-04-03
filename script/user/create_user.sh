#!/bin/bash
set -e

# Check if username argument is present
if [ $# -eq 0 ]; then
  echo "Please provide a username."
  exit 1
fi

# Set the user name from command-line argument
username="$1"

# Generate a random password of 8 characters
password=$(openssl rand -base64 6)

# Create the new user with the random password
useradd -m -p $(openssl passwd -1 $password) $username

# Set the password to expire in 14 days
chage -M 14 $username

# Print the username and password for the new user
echo "User created with credentials:"
echo "Username: $username"
echo "Password: $password"
