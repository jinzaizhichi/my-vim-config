export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"

export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

export PATH="$HOME/bin:$HOME/.local/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$JAVA_HOME/bin:$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$HOME/go/bin:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
