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

# Create the user account with the provided details
sudo useradd -m -c "$full_name" -s /bin/bash "$username"

# Generate an SSH key pair for the new user
sudo -u "$username" ssh-keygen -t rsa -N "" -f "/home/$username/.ssh/id_rsa"

echo "User account created successfully."
echo "The public key for $username is:"
sudo cat /home/"$username"/.ssh/id_rsa.pub
