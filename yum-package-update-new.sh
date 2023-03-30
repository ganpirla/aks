#!/bin/bash

# run the "yum -q check-update" command and capture the output
output=$(yum -q check-update)

# iterate over the output and extract the package name and version
packages=()
while read -r line; do
    if [[ $line =~ ([a-zA-Z0-9_\.-]+)\.[a-z0-9_-]+\s+([a-zA-Z0-9_\.-]+) ]]; then
        name="${BASH_REMATCH[1]}"
        version="${BASH_REMATCH[2]}"
        packages+=("$name-$version")
    fi
done <<< "$output"

# print the list of packages
printf '%s\n' "${packages[@]}"
