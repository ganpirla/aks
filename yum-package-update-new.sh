#!/bin/bash

# run the "yum -q update --assumeno" command and capture the output
output=$(yum -q update --assumeno)

# split the output into lines and skip the header
lines=$(echo "$output" | sed '1d')

# iterate over the lines and extract the package name, version, release, and architecture
packages=()
for line in $lines; do
    if [[ $line == Updated* ]]; then
        name=$(echo $line | awk '{print $2}' | awk -F "." '{print $1}')
        version=$(echo $line | awk '{print $2}' | awk -F "." '{print $2}')
        release=$(echo $line | awk '{print $2}' | awk -F "." '{print $3}')
        arch=$(echo $line | awk '{print $2}' | awk -F "." '{print $4}')
        packages+=("$name-$version-$release.$arch")
    fi
done

# print the list of packages
printf '%s\n' "${packages[@]}"
