#!/bin/bash

# Run the yum update command and store the output in a variable
yum_update_output=$(yum update 2>&1)

# Extract the package names using awk and print them
echo "$yum_update_output" | awk '/^([a-zA-Z0-9_-]+\.){2}[a-zA-Z0-9_-]+/{print $1}'
