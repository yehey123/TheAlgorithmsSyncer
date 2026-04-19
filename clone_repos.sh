#!/bin/bash

if [ ! -f "languages.txt" ]; then
    echo "Error: languages.txt not found."
    exit 1
fi

while IFS= read -r language || [ -n "$language" ]; do
    language=$(echo "$language" | xargs)
    if [ -z "$language" ]; then
        continue
    fi

    echo "Cloning repository for: $language"

    repo_url="https://github.com/TheAlgorithms/$language.git"

    if [ -d "$language" ]; then
        echo "Directory $language already exists. Skipping..."
        echo "-----------------------------------"
        continue
    fi

    if git clone --depth 1 "$repo_url"; then
        echo "Successfully cloned $language"
    else
        echo "Failed to clone $language. Please check if the repository exists at $repo_url"
    fi
    echo "-----------------------------------"
done < languages.txt
