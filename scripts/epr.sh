#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_magic() {
    echo -e "${BLUE}🧙‍♂️ PR Wizard: ${NC}$1"
}

print_success() {
    echo -e "${GREEN}✨ Success: ${NC}$1"
}

print_warning() {
    echo -e "${YELLOW}🤔 Hmm: ${NC}$1"
}

print_error() {
    echo -e "${RED}💥 Oops: ${NC}$1"
}

validate_title() {
    local title="$1"

    if [[ ${#title} -gt 256 ]]; then
        return 1
    fi

    return 0
}

select_target_branch() {
    print_magic "Let's choose where to send this magical PR! (Enter for main)"

    echo ""

    branches=(main $(git branch -r | grep -v HEAD | sed 's/origin\///'))

    echo "Available branches:"
    echo "0) main (default)"

    local i=1

    for branch in "${branches[@]:1}"; do
        echo "$i) $branch"
        ((i++))
    done

    read -p "Enter branch number (or press Enter for main): " branch_choice

    if [[ -z "$branch_choice" ]]; then
        echo "main"
        return
    fi

    if [[ "$branch_choice" =~ ^[0-9]+$ ]] && [ "$branch_choice" -lt ${#branches[@]} ]; then
        echo "${branches[$branch_choice]}"
    else
        print_error "Invalid branch number, falling back to main"

        echo "main"
    fi
}

easy_pull_request() {
    print_magic "Welcome to the PR creation adventure! 🚀"

    echo ""

    target_branch=$(select_target_branch)

    print_success "Target branch: $target_branch"

    echo ""

    print_magic "What shall we call this masterpiece? (Enter for --fill)"

    read -p "Title: " pr_title

    if [[ -n "$pr_title" ]]; then
        if ! validate_title "$pr_title"; then
            print_error "Title is too long! (max 256 chars)"

            return 1
        fi
    fi

    print_magic "Tell me the story behind these changes! (Enter for --fill)"

    read -p "Description: " pr_description

    echo ""

    reviewers=()

    while true; do
        print_magic "Add a reviewer? (GitHub username or Enter to continue)"

        read -p "Reviewer: " reviewer

        [[ -z "$reviewer" ]] && break

        reviewers+=("$reviewer")

        print_success "Added reviewer: $reviewer"
    done

    echo ""

    print_magic "Shall I auto-merge this PR when ready? (y/N)"

    read -p "Auto-merge: " auto_merge

    auto_merge=${auto_merge:-n}

    echo ""

    pr_command="gh pr create --base $target_branch"

    if [[ -z "$pr_title" && -z "$pr_description" ]]; then
        pr_command+=" --fill"
    else
        [[ -n "$pr_title" ]] && pr_command+=" --title \"$pr_title\""
        [[ -n "$pr_description" ]] && pr_command+=" --body \"$pr_description\""
    fi

    if [[ ${#reviewers[@]} -gt 0 ]]; then
        pr_command+=" --reviewer $(IFS=,; echo "${reviewers[*]}")"
    fi

    print_magic "🪄 Casting the PR creation spell..."

    eval "$pr_command"

    if [[ "$auto_merge" =~ ^[Yy]$ ]] && [[ ${#reviewers[@]} -eq 0 ]]; then
        print_magic "🔮 Setting up auto-merge..."
        gh pr merge --merge
    fi

    print_success "PR creation completed! May the code be with you! 🌟"
}

easy_pull_request
