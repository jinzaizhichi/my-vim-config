eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export TERM='xterm-256color'
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="$(brew --prefix)/opt/openjdk@17"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/doruk/go/bin
export PATH="$HOME/.local/bin:$PATH"

export LESS="-N -R -F -X"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export PATH="$HOME/bin:$PATH"
export WATCHMAN_SOCK="$HOME/.local/var/run/watchman/doruk-state/sock"
