eval "$(/opt/homebrew/bin/brew shellenv)"

export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

export TERM="wezterm"
export EDITOR="vi"
export BAT_THEME="ansi"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/bin:$PATH"

[ -s "${ASDF_DATA_DIR:-$HOME/.asdf}/asdf.sh" ] && source "${ASDF_DATA_DIR:-$HOME/.asdf}/asdf.sh"
[ -f ~/.cargo/env ] && source ~/.cargo/env

autoload -Uz add-zsh-hook

tmux-window-name() {
	($HOME/.config/tmux/plugins/tmux-window-name/scripts/rename_session_windows.py &)
}

add-zsh-hook chpwd tmux-window-name
