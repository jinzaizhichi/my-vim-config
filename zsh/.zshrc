export TERM='xterm-256color'
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

PS1='%B%F{magenta}%n@%m%f%b %F{cyan}%~%f $ '

alias lazygrep="~/.scripts/lazygrep.sh"
alias commit="~/.scripts/commit.sh"
alias uvp="~/.scripts/uvp.sh"
alias qms-tmux="~/.scripts/qms_tmux.sh"
alias ls="ls -GFlah"
alias kp="~/.scripts/kp.sh"

function startup_sequence() {
  messages=(
    "Not even Stack Overflow can fix your catastrophic coding incompetence"
    "Your commit history reads like a confession of technological crimes against humanity"
    "Your code is so fragile it breaks when you look at it wrong"
    "You don't write code, you commit digital war crimes"
    "Your debugging strategy: reboot and pray to silicon gods who abandoned you long ago"
    "git push --force: the digital equivalent of your poor life choices"
    "Even COBOL programmers laugh at your archaic coding style"
    "Your codebase is where good ideas go to die horrible deaths"
    "Error handling? You can't even handle basic syntax without three Google searches"
    "Your functions are more bloated than a decomposing whale carcass"
    "Documentation implies you'd understand it if you wrote it, which we both know is false"
    "Your variable names suggest you're communicating with aliens, not other developers"
    "Even WordPress developers hold emergency meetings about your code quality"
    "If technical debt were currency, your code would crash the global economy"
    "Your git history is just 'please work' and 'why god why' with timestamps of despair"
    "Code reviewers need therapy after seeing your pull requests"
    "Your database schema looks like it was designed by throwing darts blindfolded"
    "You don't write algorithms, you write algorithmic war crimes"
    "Your browser history would make even 4chan moderators question their life choices"
    "That's not a homework folder, it's a monument to your perpetual disappointment"
    "Your ISP considered terminating service just to protect the internet from you"
    "The FBI agent monitoring your activity requested hazard pay and trauma counseling"
    "Your incognito mode history would violate the Geneva Convention"
    "If imposter syndrome had a poster child, your LinkedIn profile would be it"
  )


  echo '\033[1;35m
  ⠄⠄⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄
  ⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄
  ⠄⠄⢀⡋⣡⣴⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄
  ⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄
  ⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰
  ⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤
  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗
  ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄
  ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄
  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄
  ⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄
  ⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄
  \033[0m'

  echo

  if [ ${#messages[@]} -gt 0 ]; then
    echo "\033[1m${messages[$((RANDOM % ${#messages[@]} + 1))]}\033[0m"
  fi


  echo

  todo_count=$(td | grep -c "^")

  if [ $todo_count -gt 0 ]; then
    td
  else
    echo "\033[1mYou have no active todos, just like your social life...\033[0m"
  fi

  echo
}

startup_sequence

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.work.zsh ]; then
  source ~/.work.zsh
fi
