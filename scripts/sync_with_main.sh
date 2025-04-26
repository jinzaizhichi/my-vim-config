#!/bin/bash

check_git_repo() {
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Error: Not in a git repository"

        exit 1
    fi
}

check_git_root() {
    local git_root

    git_root=$(git rev-parse --show-toplevel)

    local current_dir

    current_dir=$(pwd)

    if [ "$git_root" != "$current_dir" ]; then
        echo "Error: Please run this script from the root of the git repository"

        exit 1
    fi
}

check_branch_exists() {
    local branch_name=$1
    if ! git show-ref --verify --quiet "refs/heads/$branch_name"; then
        echo "Error: Branch '$branch_name' does not exist"

        exit 1
    fi
}

echo -n "Enter the branch name to sync with main: "

read -r branch_name

if [ -z "$branch_name" ]; then
    echo "Error: Branch name cannot be empty"

    exit 1
fi

check_git_repo
check_git_root
check_branch_exists "$branch_name"

export GIT_MERGE_AUTOEDIT=no

if git switch main && \
   git pull && \
   git switch "$branch_name" && \
   git merge main && \
   git push; then
    echo -e "\n✅ Success: Branch '$branch_name' has been synced with main!"
else
    echo -e "\n❌ Error: Failed to sync branch. Please resolve any conflicts manually."

    exit 1
fi
