export TERM='xterm-256color'
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

PS1='%B%F{magenta}%n@%m%f%b %F{cyan}%~%f $ '

alias lazygrep="~/.scripts/lazygrep.sh"
alias commit="~/.scripts/commit.sh"
alias uvp="~/.scripts/update_vim_plugints.sh"
alias ls="ls -GFla"

function startup_sequence() {
    messages=(
        "Ah, the guy who thinks console.log() is debugging"
        "Looking for Stack Overflow again? Can't write your own code?"
        "Your commit messages are as meaningful as your career"
        "Another day of copying code you don't understand?"
        "I see you're back to pretend you understand async/await"
        "How many times will you git push --force today?"
        "Even Internet Explorer has better performance than your code"
        "Your code has more bugs than features"
        "Still writing code like it's your first week?"
        "Your error handling strategy: ignore and pray"
        "Your functions are longer than your attention span"
        "Documentation? Never heard of her"
        "Your variable names look like keyboard smashes"
        "Even PHP developers laugh at your code"
        "Back to write more infinite loops?"
        "Your code makes WordPress look optimized"
        "Your git history is just 'fix bug' and 'final final v3 real'"
        "You're the reason code reviews need a 'reject all' button"
        "Your database queries would make an SQL intern cry"
        "Back to rename everything to 'temp' and 'test'?"
        "Your browser history would make Satan uncomfortable"
        "Your homework folder isn't fooling anyone"
        "Even your ISP judges your browsing habits"
        "The FBI agent monitoring you needed therapy"
        "Your incognito mode deserves hazard pay"
        "ChromeOS removed incognito mode just for you"
        "Your browser cache needs holy water"
        "Back from another 'research' session?"
        "Your bookmarks would make a priest faint"
        "The NSA agent watching you quit their job"
        "Your cookies are more cursed than a haunted house"
        "Your recommended algorithms need counseling"
        "Even your antivirus is concerned about you"
        "Your search history is a cry for help"
        "Your waifu folder is bigger than your codebase"
        "Another day of watching 'code tutorials' on certain Hub sites?"
        "Your anime collection is more organized than your git repos"
        "Tabs vs Spaces? You can't even decide on a waifu"
        "Your code is as messy as your manga collection"
        "Writing spaghetti code while watching tentacle movies?"
        "Your weeb powers are inversely proportional to your coding skills"
        "Error 404: Coding skills not found (but found 10TB of 'hentai')"
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
