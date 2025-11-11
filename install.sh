#!/bin/bash

set -e

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
DOTFILES_DIR="$HOME/kawaiDotfiles"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
else
    echo "[ERROR] Unsupported OS: $OSTYPE"
    exit 1
fi

log_info() {
    echo "[INFO] $1"
}

log_error() {
    echo "[ERROR] $1" >&2
}

check_dependencies() {
    log_info "Checking system dependencies..."

    local required_packages=("git" "npm" "watchman" "fzf" "bat" "rg" "ag" "perl" "ctags" "fd" "yarn")
    local missing=()

    for pkg in "${required_packages[@]}"; do
        if ! command -v "$pkg" &> /dev/null; then
            missing+=("$pkg")
            log_error "Missing: $pkg"
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        log_error "Missing packages: ${missing[*]}"
        log_error "Please install missing packages:"
        if [ "$OS" = "macos" ]; then
            echo "  brew install ${missing[*]}"
        else
            echo "  sudo apt install ${missing[*]} (or use your package manager)"
        fi
        exit 1
    fi

    log_info "All dependencies found"
}

clone_dotfiles() {
    log_info "Cloning dotfiles repository..."
    if [ -d "$DOTFILES_DIR" ]; then
        log_info "Dotfiles directory already exists, removing..."
        rm -rf "$DOTFILES_DIR"
    fi
    git clone git@github.com:dorukozerr/dotfiles.git "$DOTFILES_DIR" &> /dev/null
    log_info "Dotfiles cloned successfully"
}

backup_existing_configs() {
    log_info "Creating backup directory at $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"

    local files_to_backup=(
        "$HOME/.vim"
        "$HOME/.vimrc"
        "$HOME/.config/tmux"
        "$HOME/.scripts"
        "$HOME/.zshrc"
        "$HOME/.zprofile"
        "$HOME/.gitconfig"
        "$HOME/.config/wezterm"
        "$HOME/bin"
    )

    for file in "${files_to_backup[@]}"; do
        if [ -e "$file" ]; then
            log_info "Backing up $(basename "$file")"
            mv "$file" "$BACKUP_DIR/"
        fi
    done
}

setup_tmux() {
    log_info "Setting up Tmux configuration..."
    mkdir -p "$HOME/.config"
    mv "$DOTFILES_DIR/tmux" "$HOME/.config/"
    log_info "Tmux setup complete"
}

setup_scripts() {
    log_info "Setting up custom scripts..."
    mv "$DOTFILES_DIR/scripts" "$HOME/.scripts"

    local scripts=(
        "commit.sh"
        "lazy_grep.sh"
        "update_vim_plugins.sh"
        "kill_process.sh"
        "tmux_save_session.sh"
        "tmux_restore_session.sh"
        "tmux_fzf_switcher.sh"
        "tmux_file_picker.sh"
    )

    for script in "${scripts[@]}"; do
        chmod +x "$HOME/.scripts/$script"
    done

    log_info "Scripts setup complete"
}

setup_zsh() {
    log_info "Setting up Zsh configuration..."
    mv "$DOTFILES_DIR/zsh/.zshrc" "$HOME/"
    mv "$DOTFILES_DIR/zsh/.zprofile" "$HOME/"
    log_info "Zsh setup complete"
}

setup_wezterm() {
    log_info "Setting up WezTerm configuration..."
    mv "$DOTFILES_DIR/wezterm" "$HOME/.config/"
    log_info "WezTerm setup complete"
}

setup_git() {
    log_info "Setting up Git configuration..."
    mv "$DOTFILES_DIR/git/.gitconfig" "$HOME/"
    log_info "Git setup complete"
}

setup_watchman() {
    log_info "Setting up Watchman..."
    mkdir -p "$HOME/.local/var/run/watchman/doruk-state"
    mkdir -p "$HOME/.local/var/log/watchman"
    chmod 700 "$HOME/.local/var/run/watchman/doruk-state"
    chmod 755 "$HOME/.local/var/log/watchman"
    mkdir -p "$HOME/bin"
    mv "$DOTFILES_DIR/bin/watchman" "$HOME/bin/watchman"
    chmod +x "$HOME/bin/watchman"

    if command -v watchman &> /dev/null; then
        log_info "Stopping existing Watchman processes..."
        /opt/homebrew/bin/watchman shutdown-server &> /dev/null || true
        pkill -f watchman &> /dev/null || true
    fi

    log_info "Watchman setup complete"
}

setup_vim_temp() {
    log_info "Setting up temporary Vim configuration..."
    mkdir -p "$HOME/.vim/pack/plugins/start"

    cat > "$HOME/.vim/temp.vimrc" << 'EOF'
set nocompatible
set hidden
set updatetime=100
let g:coc_disable_startup_warning = 1
EOF

    log_info "Temporary Vim config created"
}

install_vim_plugins() {
    log_info "Installing Vim plugins..."
    cd "$HOME/.vim/pack/plugins/start"

    local plugins=(
        "https://github.com/tpope/vim-fugitive.git"
        "https://github.com/junegunn/fzf.git"
        "https://github.com/junegunn/fzf.vim.git"
        "https://github.com/neoclide/coc.nvim.git"
        "https://github.com/vim-airline/vim-airline.git"
        "https://github.com/vim-airline/vim-airline-themes.git"
        "https://github.com/ryanoasis/vim-devicons.git"
        "git@github.com:dorukozerr/kisuke.vim.git"
        "https://github.com/MaxMEllon/vim-jsx-pretty.git"
        "https://github.com/Konfekt/FastFold.git"
        "git@github.com:adelarsq/vim-matchit.git"
        "https://github.com/mg979/vim-visual-multi.git"
        "git@github.com:justinmk/vim-sneak.git"
    )

    for plugin in "${plugins[@]}"; do
        git clone "$plugin" &> /dev/null &
    done

    wait

    log_info "Vim plugins cloned successfully"
}

build_vim_plugins() {
    log_info "Building Vim plugins..."

    (cd "$HOME/.vim/pack/plugins/start/coc.nvim" && npm ci &> /dev/null) &
    (cd "$HOME/.vim/pack/plugins/start/fzf" && ./install --all &> /dev/null) &
    (cd "$HOME/.vim/pack/plugins/start/kisuke.vim" && yarn build &> /dev/null) &

    wait

    cd "$HOME"
    log_info "Vim plugins built successfully"
}

install_coc_extensions() {
    log_info "Installing CoC extensions..."
    yes | vim -u "$HOME/.vim/temp.vimrc" -c 'CocInstall -sync coc-vimlsp coc-sh coc-tsserver coc-go coc-html coc-css @yaegassy/coc-tailwindcss3 coc-json coc-yaml coc-prettier coc-eslint coc-dotenv coc-sql coc-lua coc-svg' -c 'qall!' > /dev/null 2>&1
    log_info "CoC extensions installed successfully"
}

setup_vim_final() {
    log_info "Setting up final Vim configuration..."
    mv "$DOTFILES_DIR/vim/"* "$HOME/.vim/"
    mv "$HOME/.vim/simple_black_metal.vim" "$HOME/.vim/pack/plugins/start/vim-airline-themes/autoload/airline/themes/"
    log_info "Vim configuration complete"
}

cleanup() {
    log_info "Cleaning up temporary files..."
    rm -f "$HOME/.vim/temp.vimrc"
    rm -rf "$DOTFILES_DIR"
    log_info "Cleanup complete"
}

main() {
    log_info "Starting dotfiles installation..."

    check_dependencies
    clone_dotfiles
    backup_existing_configs
    setup_tmux
    setup_scripts
    setup_zsh
    setup_wezterm
    setup_git
    setup_watchman
    setup_vim_temp
    install_vim_plugins
    build_vim_plugins
    install_coc_extensions
    setup_vim_final
    cleanup

    log_info "Installation complete! Backup saved to $BACKUP_DIR"
    log_info "Please restart your terminal or source config files"
}

main
