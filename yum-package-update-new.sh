#!/bin/bash

# Run the "yum -q check-update" command and capture the output
output=$(yum -q check-update)

# Extract the package name, version and architecture from each line of the output
while read -r line; do
    package=$(echo "$line" | awk '{print $1}')
    version=$(echo "$line" | awk '{print $2}')
    arch=$(echo "$line" | awk '{print $3}')
    
    # Replace the dot in the package name with a hyphen
    formatted_package=$(echo "$package" | sed 's/\./-/g')
    
    # Print the package name, version and architecture in the desired format
    printf "%s.%s\t%s.%s\n" "$formatted_package" "$arch" "$version" "$arch"
done <<< "$output"
