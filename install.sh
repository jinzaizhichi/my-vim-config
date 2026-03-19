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
      echo "  paru ${missing[*]} (or use your package manager)"
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

  cd $DOTFILES_DIR
  git submodule update --recursive --init &> /dev/null

  log_info "Dotfiles cloned successfully"
}

backup_existing_configs() {
  log_info "Creating backup directory at $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"

  local files_to_backup=(
    "$HOME/.zshenv"
    "$HOME/.zprofile"
    "$HOME/.zshrc"
    "$HOME/.config/zsh/.zprofile"
    "$HOME/.config/zsh/.zshrc"
    "$HOME/.config/zsh/zsh.d"
    "$HOME/.config/zsh/plugins"
    "$HOME/.gitconfig"
    "$HOME/.vim"
    "$HOME/.vimrc"
    "$HOME/.config/tmux"
    "$HOME/.config/wezterm"
    "$HOME/.config/htop"
    "$HOME/.scripts"
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

  cd "$HOME/.scripts/"

  rm -rf cring_source

  for SCRIPT in $(\ls "$HOME/.scripts"); do
    chmod +x "$SCRIPT"
  done

  log_info "Scripts setup complete"
}

setup_zsh() {
  log_info "Setting up Zsh configuration..."
  mkdir -p "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/.zshenv" "$HOME/"
  mv "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/zsh.d" "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/plugins" "$HOME/.config/zsh"
  log_info "Zsh setup complete"
}

setup_wezterm() {
  log_info "Setting up WezTerm configuration..."
  mv "$DOTFILES_DIR/wezterm" "$HOME/.config/"
  log_info "WezTerm setup complete"
}

setup_htop() {
  log_info "Setting up htop configuration..."
  mv "$DOTFILES_DIR/htop" "$HOME/.config/"
  log_info "htop setup complete"
}

setup_git() {
  log_info "Setting up Git configuration..."
  mv "$DOTFILES_DIR/git/.gitconfig" "$HOME/"
  log_info "Git setup complete"
}

setup_vim() {
  log_info "Setting up Vim configuration..."
  mv "$DOTFILES_DIR/vim" "$HOME/.vim/"
  log_info "Installing CoC extensions..."
  yes | vim -c 'CocInstall -sync coc-vimlsp coc-sh coc-tsserver coc-go coc-html coc-css @yaegassy/coc-tailwindcss3 coc-json coc-yaml coc-prettier coc-eslint coc-dotenv coc-sql coc-lua coc-toml coc-svg coc-zshell' -c 'qall!' > /dev/null 2>&1
  log_info "CoC extensions installed successfully"
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
  setup_htop
  setup_git
  setup_vim
  cleanup

  log_info "Installation complete! Backup saved to $BACKUP_DIR"
  log_info "Please restart your terminal or source config files"
}

main
