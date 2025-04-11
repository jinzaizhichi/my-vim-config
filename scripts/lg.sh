#!/bin/bash

lazygrep() {
    local search_term
    local file_types
    local exclude_dirs
    local grep_cmd="grep -rn"

    echo -n "Enter search term: "

    read search_term

    echo -n "File types to search (comma-separated, press enter for default js,jsx,ts,tsx): "

    read file_types

    if [[ -z "$file_types" ]]; then
        file_types="js,jsx,ts,tsx"
    fi

    echo -n "Directories to exclude (comma-separated, press enter for default node_modules,build,dist,.next,.expo,ios,android): "

    read exclude_dirs

    if [[ -z "$exclude_dirs" ]]; then
        exclude_dirs="node_modules,build,dist,.next,.expo,ios,android"
    fi

    grep_cmd+=" $search_term . -C 0 --include=\*.{${file_types}} --color=auto --exclude-dir={${exclude_dirs}}"

    echo "Executing: $grep_cmd"

    eval "$grep_cmd"

    if [ $? -ne 0 ]; then
        echo "No matches found for '$search_term'."
    fi
}

lazygrep
