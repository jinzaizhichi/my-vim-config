export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"

export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

export TERM="wezterm"
export EDITOR="vi"
export BAT_THEME="ansi"

export CLAUDE_CONFIG_DIR="$HOME/.config/claude"
export ASDF_DATA_DIR="$HOME/.config/asdf"

export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"

export BUN_INSTALL="$HOME/.bun"

export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/sbin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/go/bin"
export PATH="$BUN_INSTALL/bin:$PATH"

export WATCHMAN_SOCK="$HOME/.local/var/run/watchman/custom/s.sock"
# export WATCHMAN_SOCK="$HOME/.sandbox/watchman/proxy.sock"
