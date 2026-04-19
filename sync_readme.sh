#!/bin/bash

LANGUAGES_FILE="languages.txt"
README_FILE="README.md"
TEMP_FILE="README.md.tmp"

if [ ! -f "$LANGUAGES_FILE" ] || [ ! -f "$README_FILE" ]; then
    echo "Required files missing."
    exit 1
fi

# Create the list of languages in markdown format
LANG_LIST=""
while IFS= read -r lang || [ -n "$lang" ]; do
    lang=$(echo "$lang" | xargs)
    if [ -n "$lang" ]; then
        LANG_LIST="${LANG_LIST}- ${lang}\n"
    fi
done < "$LANGUAGES_FILE"

# Use awk to replace content between markers
awk -v content="$LANG_LIST" '
    /<!-- LANGUAGES_START -->/ {
        print $0
        printf "%s", content
        skip = 1
        next
    }
    /<!-- LANGUAGES_END -->/ {
        skip = 0
    }
    !skip {
        print $0
    }
' "$README_FILE" > "$TEMP_FILE"

mv "$TEMP_FILE" "$README_FILE"
