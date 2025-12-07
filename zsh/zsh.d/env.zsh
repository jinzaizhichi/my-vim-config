export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true

nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    npx "$@"
}

export TERM="wezterm"

export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"

export WATCHMAN_SOCK="$HOME/.local/var/run/watchman/custom/s.sock"
# export WATCHMAN_SOCK="$HOME/.sandbox/watchman/proxy.sock"
