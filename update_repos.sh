#!/bin/bash

if [ ! -f "languages.txt" ]; then
    echo "Error: languages.txt not found."
    exit 1
fi

while IFS= read -r lang || [ -n "$lang" ]; do
    if [ -z "$lang" ]; then
        continue
    fi

    echo "----------------------------------------"
    echo "Updating $lang..."

    if [ -d "$lang" ]; then
        cd "$lang" || continue
        if [ -d ".git" ]; then
            git fetch --all && git pull
        else
            echo "Warning: $lang is not a git repository."
        fi
        cd ..
    else
        echo "Warning: Directory $lang does not exist."
    fi
done < languages.txt

echo "----------------------------------------"
echo "All updates complete."
