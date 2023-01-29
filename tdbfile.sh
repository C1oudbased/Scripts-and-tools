#!/bin/bash

# Assigns the output of the find command to $files
files=$(find /var/lib/samba/printing -name "*.tdb")
# Loop over file in $files
for file in $files; do
    # Assigns first field of wc -c to $size (File size in bytes)
    size=$(wc -c "$file" | awk '{print $1}')
    # If $size > 50,000 bytes, then
    if [ $size -gt 50000 ] ; then
        # Delete $file
        rm "$file"
        # echo which file was deleted
        echo "Deleted $file"
    fi
done