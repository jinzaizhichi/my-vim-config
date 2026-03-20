#!/bin/bash

set -e

BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
DOTFILES_DIR="$HOME/kawaiDotfiles"

play_frames() {
  local file="$1" delay="${2:-0.1}" frame=""
  local -a frames=()
  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ -z "$line" ]]; then
      [[ -n "$frame" ]] && frames+=("$frame"); frame=""
    else
      frame+="$line"$'\n'
    fi
  done < "$file"
  [[ -n "$frame" ]] && frames+=("$frame")

  local frame_h=11 frame_w=24
  local top_pad=$(( ($(tput lines) - frame_h) / 2 ))
  local left_pad=$(( ($(tput cols) - frame_w) / 2 ))

  printf '\033[2J\033[H'
  for ((i=0; i < top_pad + frame_h; i++)); do printf '\n'; done

  while true; do
    for f in "${frames[@]}"; do
      printf "\033[%dA" "$frame_h"
      while IFS= read -r line; do
        printf "%${left_pad}s%s\n" "" "$line"
      done <<< "${f%$'\n'}"
      sleep "$delay"
    done
  done
}

detach_submodule() {
  mkdir -p "$(dirname "$2")"
  mv "$DOTFILES_DIR/$1" "$2"
  rm "$2/.git"
  mv "$DOTFILES_DIR/.git/modules/$1" "$2/.git"
  git config --file "$2/.git/config" --unset core.worktree
}

main() {
  [ -d "$DOTFILES_DIR" ] && rm -rf "$DOTFILES_DIR"
  git clone git@github.com:dorukozerr/dotfiles.git "$DOTFILES_DIR" --recurse-submodules &>/dev/null
  git -C "$DOTFILES_DIR" submodule update --init --rebase --recursive
  git -C "$DOTFILES_DIR" submodule sync --recursive

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

  cd "$(dirname "$DOTFILES_DIR")"
  for pair in \
    "vim/pack/plugins/start:$HOME/.vim/pack/plugins/start" \
    "zsh/plugins:$HOME/.config/zsh/plugins" \
    "tmux/plugins:$HOME/.config/tmux/plugins"; do
    src="${pair%%:*}"; dest="${pair##*:}"
    for d in "$DOTFILES_DIR/$src"/*/; do
      p=$(basename "$d")
      detach_submodule "$src/$p" "$dest/$p"
    done
  done

  mkdir -p "$HOME/.config/tmux"
  cp -r "$DOTFILES_DIR/tmux/." "$HOME/.config/tmux/"

  mv "$DOTFILES_DIR/scripts" "$HOME/.scripts"
  rm -rf "$HOME/.scripts/cring_source"
  chmod +x "$HOME/.scripts"/*

  mkdir -p "$HOME/.config/zsh"
  mv "$DOTFILES_DIR/zsh/.zshenv" "$HOME/"
  mv "$DOTFILES_DIR/zsh/.zprofile" "$DOTFILES_DIR/zsh/.zshrc" "$DOTFILES_DIR/zsh/zsh.d" "$HOME/.config/zsh"

  mv "$DOTFILES_DIR/wezterm" "$DOTFILES_DIR/htop" "$HOME/.config/"
  mv "$DOTFILES_DIR/git/.gitconfig" "$HOME/"

  cp -r "$DOTFILES_DIR/vim/." "$HOME/.vim/"
  yes | vim -c 'CocInstall -sync coc-vimlsp coc-sh coc-tsserver coc-go coc-html coc-css @yaegassy/coc-tailwindcss3 coc-json coc-yaml coc-prettier coc-eslint coc-dotenv coc-sql coc-lua coc-toml coc-svg coc-zshell' -c 'qall!' >/dev/null 2>&1

  rm -f "$HOME/.vim/temp.vimrc"
  rm -rf "$DOTFILES_DIR"
}

FRAMES_FILE="$(mktemp)"
curl -fsSL "https://raw.githubusercontent.com/dorukozerr/dotfiles/refs/heads/main/rm.frames" -o "$FRAMES_FILE"

printf '\033[?25l'
play_frames "$FRAMES_FILE" 0.1 &
ANIM_PID=$!
trap 'kill "$ANIM_PID" 2>/dev/null; rm -f "$FRAMES_FILE"; printf "\033[?25h"' EXIT INT TERM

main
