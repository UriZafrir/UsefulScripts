#!/bin/bash

# Define the output file path
output_file="/path/to/output.csv"

# Write the CSV header
echo "Website,Version" > "$output_file"

# Loop through each directory in /var/www
for directory in /var/www/*; do
  if [[ -d "$directory" ]]; then
    # Extract the website name from the directory path
    website_name=$(basename "$directory")
    
    # Move into the directory
    cd "$directory" || continue
    
    # Get the current directory and version using 'wp core version' command
    current_dir=$(pwd)
    version=$(wp core version --allow-root)
    
    # Write the website name and version to the output file
    echo "$website_name,$version" >> "$output_file"
    
    # Print the current directory and version to the console
    echo "Current Directory: $current_dir"
    echo "Version: $version"
    echo
  fi
done
