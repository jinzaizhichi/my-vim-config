#!/bin/bash

set -e

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
DOTFILES_DIR="$HOME/kawaiDotfiles"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

play_frames() {
  local file="$1"
  local delay="${2:-0.1}"
  local frame=""
  local -a frames=()

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ -z "$line" ]]; then
      [[ -n "$frame" ]] && frames+=("$frame")
      frame=""
    else
      frame+="$line"$'\n'
    fi
  done < "$file"
  [[ -n "$frame" ]] && frames+=("$frame")

  local height=11
  for ((i=0; i<height; i++)); do printf '\n'; done

  while true; do
    for f in "${frames[@]}"; do
      printf "\033[%dA" "$height"
      printf '%s' "$f"
      sleep "$delay"
    done
  done
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

main() {
  # Clone
  # [ -d "$DOTFILES_DIR" ] && rm -rf "$DOTFILES_DIR"
  # git clone git@github.com:dorukozerr/dotfiles.git "$DOTFILES_DIR" --recurse-submodules &> /dev/null
  # git -C "$DOTFILES_DIR" submodule update --init --rebase --recursive
  # git -C "$DOTFILES_DIR" submodule sync --recursive

  # Backup
  mkdir -p "$BACKUP_DIR"
  for file in \
    "$HOME/.zshenv" "$HOME/.zprofile" "$HOME/.zshrc" \
    "$HOME/.config/zsh/.zprofile" "$HOME/.config/zsh/.zshrc" \
    "$HOME/.config/zsh/zsh.d" "$HOME/.config/zsh/plugins" \
    "$HOME/.gitconfig" "$HOME/.vim" "$HOME/.vimrc" \
    "$HOME/.config/tmux" "$HOME/.config/wezterm" \
    "$HOME/.config/htop" "$HOME/.scripts" "$HOME/bin"; do
    [ -e "$file" ] && mv "$file" "$BACKUP_DIR/"
  done

  # Detach plugins
  cd "$(dirname "$DOTFILES_DIR")"
  for d in "$DOTFILES_DIR/vim/pack/plugins/start"/*/; do
    p=$(basename "$d")
    detach_submodule "vim/pack/plugins/start/$p" "$HOME/.vim/pack/plugins/start/$p"
  done
  for d in "$DOTFILES_DIR/zsh/plugins"/*/; do
    p=$(basename "$d")
    detach_submodule "zsh/plugins/$p" "$HOME/.config/zsh/plugins/$p"
  done
  for d in "$DOTFILES_DIR/tmux/plugins"/*/; do
    p=$(basename "$d")
    detach_submodule "tmux/plugins/$p" "$HOME/.config/tmux/plugins/$p"
  done

  # Tmux
  mkdir -p "$HOME/.config/tmux"
  cp -r "$DOTFILES_DIR/tmux/." "$HOME/.config/tmux/"

  # Scripts
  mv "$DOTFILES_DIR/scripts" "$HOME/.scripts"
  rm -rf "$HOME/.scripts/cring_source"
  for script in $(\ls "$HOME/.scripts"); do
    chmod +x "$HOME/.scripts/$script"
  done

  # Zsh
  mkdir -p "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/.zshenv" "$HOME/"
  mv "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/zsh.d" "$HOME/.config/zsh"

  # Wezterm, htop, git
  mv "$DOTFILES_DIR/wezterm" "$HOME/.config/"
  mv "$DOTFILES_DIR/htop" "$HOME/.config/"
  mv "$DOTFILES_DIR/git/.gitconfig" "$HOME/"

  # Vim
  cp -r "$DOTFILES_DIR/vim/." "$HOME/.vim/"
  yes | vim -c 'CocInstall -sync coc-vimlsp coc-sh coc-tsserver coc-go coc-html coc-css @yaegassy/coc-tailwindcss3 coc-json coc-yaml coc-prettier coc-eslint coc-dotenv coc-sql coc-lua coc-toml coc-svg coc-zshell' -c 'qall!' > /dev/null 2>&1

  # Cleanup
  rm -f "$HOME/.vim/temp.vimrc"
  rm -rf "$DOTFILES_DIR"

}

printf '\033[?25l'
play_frames "$SCRIPT_DIR/rm.frames" 0.1 &
ANIM_PID=$!
trap 'kill "$ANIM_PID" 2>/dev/null; printf "\033[?25h"' EXIT INT TERM

main
