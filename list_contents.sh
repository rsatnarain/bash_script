#!/bin/bash

# --- PARAMETERS & VARIABLES ---
# $1: The first argument passed to the script (the directory path).
# TARGET_DIR: Variable storing the path to inspect. 
# ${1:-.}: If $1 is empty/unset, it defaults to "." (current directory).
TARGET_DIR="${1:-.}"

report="file_dir_report_$(date +%F).txt"

# --- DIRECTORY VALIDATION ---
# [ ! -d "$TARGET_DIR" ]: Tests if the target is NOT a directory.
# -d: Flag to check for directory existence.
# !: Logical NOT operator.
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: '$TARGET_DIR' is not a directory." > "$report"
    echo "Please provide a valid directory path." >> "$report"
    cat "$report" # Display the error message
    exit 1 # Exit with error status
fi

echo "Target Directory: $TARGET_DIR" > "$report"
echo "--------------------------" >> "$report"

# --- ARRAY INITIALIZATION ---
# dirs: Array to store names of subdirectories.
# files: Array to store names of regular files.
dirs=()
files=()

# --- CONTENT PROCESSING ---
# for entry in "$TARGET_DIR"/*: 
# Iterates through every non-hidden item in the target directory.
# The '*' glob expands to all items.
for entry in "$TARGET_DIR"/*; do
    
    # [ -e "$entry" ] || continue:
    # If the directory is empty, the glob '*' might remain as a literal string.
    # This check ensures we only process entries that actually exist.
    [ -e "$entry" ] || continue
    
    # basename: Extracts just the filename/foldername from a full path.
    # name: Stores the extracted short name.
    name=$(basename "$entry")
    
    # Check if the entry is a directory
    if [ -d "$entry" ]; then
        dirs+=("$name") # Append name to the dirs array
    # Check if the entry is a regular file
    elif [ -f "$entry" ]; then
        files+=("$name") # Append name to the files array
    fi
done

# --- OUTPUT GENERATION ---

# ${#files[@]}: Gets the count (number of elements) in the 'files' array.
echo "Total unhidden files: ${#files[@]}" >> "$report"
echo "" >> "$report"

echo "Directories:" >> "$report"
echo "------------" >> "$report"
# Iterates through the 'dirs' array and pipes names to 'sort' for alphabetical order.
for d in "${dirs[@]}"; do
    echo "$d" >> "$report"
done | sort

echo ""
echo "Files:" >> "$report"
echo "------" >> "$report"
# Iterates through the 'files' array and pipes names to 'sort' for alphabetical order.
for f in "${files[@]}"; do
    echo "$f" >> "$report"
done | sort

echo "Data saved to $report"
echo "System report generation completed."