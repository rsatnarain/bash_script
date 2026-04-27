#!/bin/bash

# Check if a directory is provided, otherwise use current directory
TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: '$TARGET_DIR' is not a directory."
    exit 1
fi

echo "Target Directory: $TARGET_DIR"
echo "--------------------------"

# Arrays to store names
dirs=()
files=()

# Iterate over items in the target directory (excluding hidden ones)
# We use a subshell and cd to easily get relative names without complicated path manipulation
for entry in "$TARGET_DIR"/*; do
    # Skip if no match found (happens if directory is empty)
    [ -e "$entry" ] || continue
    
    name=$(basename "$entry")
    
    if [ -d "$entry" ]; then
        dirs+=("$name")
    elif [ -f "$entry" ]; then
        files+=("$name")
    fi
done

echo "Total unhidden files: ${#files[@]}"
echo ""

echo "Directories:"
echo "------------"
for d in "${dirs[@]}"; do
    echo "$d"
done | sort

echo ""
echo "Files:"
echo "------"
for f in "${files[@]}"; do
    echo "$f"
done | sort
