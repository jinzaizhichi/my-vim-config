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
  git clone git@github.com:dorukozerr/dotfiles.git "$DOTFILES_DIR" &> /dev/null --recurse-submodules --depth 1
  git -C "$DOTFILES_DIR" submodule update --init --rebase --recursive
  git -C "$DOTFILES_DIR" submodule sync --recursive

  log_info "Dotfiles cloned successfully"
}

detach_submodule() {
  local rel_path="$1"
  local dest="$2"

  mkdir -p "$(dirname "$dest")"
  mv "$DOTFILES_DIR/$rel_path" "$dest"
  rm "$dest/.git"
  mv "$DOTFILES_DIR/.git/modules/$rel_path" "$dest/.git"
  git config --file "$dest/.git/config" --unset core.worktree
}

setup_plugins() {
  log_info "Detaching submodules as standalone repos..."
  cd "$(dirname "$DOTFILES_DIR")"
  local vim_plugins=(
    "vim-fugitive" "fzf.vim" "vim-airline" "vim-airline-themes" "vim-devicons"
    "kisuke.vim" "vim-jsx-pretty" "FastFold" "vim-matchit" "vim-visual-multi"
    "vim-sneak" "candle-grey" "base16-vim" "killersheep" "coc.nvim"
  )
  local zsh_plugins=("zsh-autopair" "zsh-syntax-highlighting" "fzf-clipboard")
  local tmux_plugins=("tmux-copycat" "tmux-git-autofetch" "tmux-notify" "tmux-now-playing" "tmux-resurrect" "tmux-yank")
  for p in "${vim_plugins[@]}";  do detach_submodule "vim/pack/plugins/start/$p"  "$HOME/.vim/pack/plugins/start/$p";  done
  for p in "${zsh_plugins[@]}";  do detach_submodule "zsh/plugins/$p"             "$HOME/.config/zsh/plugins/$p";      done
  for p in "${tmux_plugins[@]}"; do detach_submodule "tmux/plugins/$p"            "$HOME/.config/tmux/plugins/$p";     done
  log_info "Plugins detached successfully"
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
  mkdir -p "$HOME/.config/tmux"
  cp -r "$DOTFILES_DIR/tmux/." "$HOME/.config/tmux/"
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
  cp -r "$DOTFILES_DIR/vim/." "$HOME/.vim/"
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
  setup_plugins
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
