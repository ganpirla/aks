#!/bin/bash

# Create input file with input values for each user
cat <<EOF > input.txt
John
30
Sarah
25
EOF

# Read input values for each user from input.txt file
while read name; do
    read age

    # Execute script with input values for current user
    echo "User: $name"
    echo "Age: $age"
    ./script.sh <<< "$name"$'\n'"$age"
done < input.txt
