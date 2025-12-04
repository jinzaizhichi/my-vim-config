export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export TERM="tmux-256color"

export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$(brew --prefix)/opt/openjdk@17"

export WATCHMAN_SOCK="$HOME/.local/var/run/watchman/custom/s.sock"
# export WATCHMAN_SOCK="$HOME/.sandbox/watchman/proxy.sock"
