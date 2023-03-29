yum-update-packages.sh

#!/bin/bash

# Run the "yum check-update" command and store the output in a variable
yum_output=$(yum -q check-update)

# Loop through each line of the output
while read -r line; do
  # Extract the package name and version from each line
  package_name=$(echo "$line" | awk '{print $1}')
  package_version=$(echo "$line" | awk '{print $2}')

  # Replace any periods in the version with hyphens
  package_version=${package_version//./-}

  # Print the installable package name
  echo "${package_name}-${package_version}"
done <<< "$yum_output"
