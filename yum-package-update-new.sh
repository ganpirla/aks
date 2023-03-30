#!/bin/bash

# Run the "yum -q check-update" command and capture the output
output=$(yum -q check-update)

# Filter the output to remove lines containing only "=" characters
filtered_output=$(echo "$output" | grep -v '^=\+$')

# Print the modified output
echo "$filtered_output"
