#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

PLUGIN_DIR="$HOME/.vim/pack/plugins/start"

print_status() {
    echo -e "${2}[${1}]${NC} ${3}"
}

update_regular_plugin() {
    local plugin_name=$1
    cd "$plugin_name" || return 1

    print_status "INFO" "$YELLOW" "Updating $plugin_name..."
    if git pull origin master; then
        print_status "SUCCESS" "$GREEN" "Updated $plugin_name"
        return 0
    else
        print_status "ERROR" "$RED" "Failed to update $plugin_name"
        return 1
    fi
}

update_fzf() {
    cd "fzf" || return 1
    print_status "INFO" "$YELLOW" "Updating fzf..."

    if git pull origin master; then
        print_status "INFO" "$YELLOW" "Running fzf install script..."

        if ./install --all; then
            print_status "SUCCESS" "$GREEN" "Updated fzf successfully"
            return 0
        else
            print_status "ERROR" "$RED" "Failed to run fzf install script"
            return 1
        fi
    else
        print_status "ERROR" "$RED" "Failed to update fzf"
        return 1
    fi
}

update_coc() {
    cd "coc.nvim" || return 1
    print_status "INFO" "$YELLOW" "Updating coc.nvim..."

    if git pull origin master; then
        print_status "INFO" "$YELLOW" "Running npm ci for coc.nvim..."
        if npm ci; then
            print_status "SUCCESS" "$GREEN" "Updated coc.nvim successfully"
            return 0
        else
            print_status "ERROR" "$RED" "Failed to run yarn install for coc.nvim"
            return 1
        fi
    else
        print_status "ERROR" "$RED" "Failed to update coc.nvim"
        return 1
    fi
}

main() {
    if [ ! -d "$PLUGIN_DIR" ]; then
        print_status "ERROR" "$RED" "Plugin directory not found: $PLUGIN_DIR"
        exit 1
    fi

    cd "$PLUGIN_DIR" || exit 1
    print_status "INFO" "$YELLOW" "Starting plugin updates..."

    local failed_plugins=()

    for plugin in */; do
        plugin=${plugin%/}

        local current_dir=$(pwd)

        case $plugin in
            "fzf")
                update_fzf || failed_plugins+=("$plugin")
                ;;
            "coc.nvim")
                update_coc || failed_plugins+=("$plugin")
                ;;
            *)
                update_regular_plugin "$plugin" || failed_plugins+=("$plugin")
                ;;
        esac

        cd "$current_dir" || exit 1
    done

    echo
    if [ ${#failed_plugins[@]} -eq 0 ]; then
        print_status "SUCCESS" "$GREEN" "All plugins updated successfully!"
    else
        print_status "WARNING" "$YELLOW" "Some plugins failed to update:"
        for plugin in "${failed_plugins[@]}"; do
            echo -e "${RED}  - $plugin${NC}"
        done
    fi
}

main
