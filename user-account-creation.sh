#!/bin/bash

# Get user input for username
read -p "Enter new username: " username

# Check if the username already exists
if id "$username" >/dev/null 2>&1; then
    echo "Username already exists. Please choose a different username."
    exit 1
fi

# Get user input for full name
read -p "Enter full name: " full_name

# Get user input for password
read -s -p "Enter password: " password
echo

# Create the user account with the provided details
sudo useradd -m -c "$full_name" -s /bin/bash "$username"

# Set the user account password
echo "$username:$password" | sudo chpasswd

echo "User account created successfully."
