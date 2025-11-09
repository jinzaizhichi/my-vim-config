if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz vcs_info
autoload -Uz compinit
compinit

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{5} 󰊢 %b%f'

PS1=$'%B%F{5}╭─%f%F{5}%n%f%F{5}@%f%F{5}%m%f %F{5}󰉋%f %F{5}%~%f${vcs_info_msg_0_}\n%B%F{5}╰─%f%b%F{5}%f '

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS="
  --color=fg:4,bg:-1,hl:2
  --color=fg+:6,bg+:-1,hl+:2
  --color=info:8,prompt:3,pointer:6
  --color=marker:2,spinner:8,header:8
  --border=none
  --preview-border=none
  --input-border=none
  --height=100%
"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --theme=ansi {} 2>/dev/null || cat {}'
"

export FZF_CTRL_R_OPTS="
  --no-preview
"

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="
  --preview 'ls -la {}'
"

alias ls="ls -GFlah"
alias commit="~/.scripts/commit.sh"
alias lg="~/.scripts/lazy_grep.sh"
alias uvp="~/.scripts/update_vim_plugins.sh"
alias kp="~/.scripts/kill_process.sh"
alias far="~/.scripts/find_and_replace.sh"
alias tss="~/.scripts/tmux_save_session.sh"
alias trs="~/.scripts/tmux_restore_session.sh"

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
export HISTSIZE=50000
export SAVEHIST=50000

if [ -f "$HOME/.config/tmux/session" ] && [ -z "$TMUX" ] && [ -z "$TMUX_RESTORED" ]; then
    if ! tmux list-sessions &>/dev/null; then
        export TMUX_RESTORED=1
        trs
    fi
fi

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
    "Your code has more tentacles than an eldritch horror anime, and twice the nightmare fuel"
    "Your programming style is like a bad yaoi plot - forced, uncomfortable, and nobody asked for it"
    "Even your waifu body pillow tries to escape while you code"
    "Your repository makes anime fillers seem like quality content"
    "Your IDE is the only thing that will ever go down on you"
    "The way you handle exceptions is more disturbing than any cursed anime you've secretly watched"
    "Your code reviews are the technological equivalent of walking in on your parents"
    "If disappointment was an anime protagonist, you'd be the entire series"
    "Each line of your code reads like the subtitles of a hentai - nonsensical and deeply concerning"
    "Your merge conflicts are more painful than a thousand episodes of filler"
    "Your GitHub profile is the digital equivalent of that weird shrine in your closet"
    "Your code makes people more uncomfortable than accidental eye contact during an anime beach episode"
    "Your pull requests get rejected more than you do in real life"
    "Your variables are named like you're trying to summon some forbidden anime deity"
    "Your conditional statements have more issues than a yandere girlfriend"
    "The relationship between your classes is more twisted than any anime love triangle"
    "Your code is so bad even the tsundere compiler won't acknowledge it"
    "You handle data the way anime protagonists handle emotions - poorly and with unnecessary drama"
    "Your database relationships are more dysfunctional than any anime high school romance"
    "Your memory management skills are worse than an anime protagonist with amnesia"
    "You've been staring at that error message longer than a protagonist in a transformation sequence"
    "Your code makes spaghetti look organized - even the tentacle monsters are confused"
    "Your password security is weaker than a background character in a fight scene"
    "The architecture of your application is more convoluted than the plot of Evangelion"
    "Your version control strategy is just 'notice me, Git-senpai'"
    "Your code whispers eldritch hentai incantations that corrupt your soul with every compile"
    "Debugging your mess feels like being trapped in a yandere's basement, begging for release"
    "Your functions breed like unchecked tentacles in a forbidden doujin, spawning horrors unending"
    "Git merge? More like NTR where your changes get cucked by upstream perversions"
    "Your variable scopes are as violated as a hentai protagonist's personal space"
    "Infinite loops in your mind mirror the endless cycle of your perverse anime addictions"
    "Each bug is a mental fracture, a crack where hentai demons seep into your fractured psyche"
    "Your codebase is a labyrinth of twisted fetishes, where logic dies screaming"
    "Pull requests from you trigger existential dread, like discovering your waifu's dark secret"
    "Memory leaks drain your sanity like a succubus feeding on your coding impotence"
    "Your algorithms twist reality into shapes that would make Lovecraft blush with perversion"
    "Refactoring? That's just admitting your code is a grotesque hentai mutation begging for euthanasia"
    "Your error logs read like a madman's diary of tentacle-induced hallucinations"
    "Inheritance in your classes is more incestuous than an anime family tree gone wrong"
    "You code like you're possessed by a hentai ghost, haunting your own repositories with shame"
    "Every syntax error is a whip crack in the BDSM dungeon of your programming failures"
    "Your repo is a cesspool where good intentions drown in waves of perverted inefficiency"
    "Debug sessions last longer than your stamina in those secret late-night anime marathons"
    "Your data structures are as stable as a yandere's mood swings during a full moon"
    "Forking your repo feels like inviting a curse, spreading your mental perversions virally"
    "Null pointers in your code point to the void where your dignity once resided"
    "Your comments are lies whispered to hide the perverse truths of your implementation"
    "Building your project is like summoning a hentai elder god—beautiful terror ensues"
    "Your optimization attempts are as futile as resisting the call of forbidden doujins"
    "Threads in your app tangle like tentacles in a nightmarish orgy of concurrency hell"
    "Your API endpoints expose more vulnerabilities than a hentai plot hole"
    "Version bumps? Just masking the growing tumor of your code's mental degeneracy"
    "Your bash scripts whisper perverse commands that corrupt your terminal's innocence"
    "Every compile error is a rejection from the waifu of perfect code you can never attain"
    "Your regex patterns match the chaos of your twisted, anime-fueled subconscious"
    "Profiling your code reveals performance bottlenecks deeper than your personal abyss"
    "Your modular design is a facade for the fragmented shards of your pervert psyche"
    "Git blame points fingers at you, the architect of this digital house of horrors"
    "Your unit tests fail more spectacularly than your attempts at social interaction"
    "Encapsulation? You can't even encapsulate your own deviant thoughts"
    "Your code evolves like a hentai monster, growing appendages of unintended behavior"
    "The stack trace of your life leads back to that first forbidden anime download"
    "Your interfaces promise much but deliver the disappointment of a cliffhanger ending"
    "Caching your failures won't hide the perverse history etched in your browser"
    "Your deployment scripts deploy despair, crashing servers with your incompetence"
    "Recursion in your functions mirrors the recursive nightmare of your existence"
    "Your code is the eldritch offspring of madness and unchecked hentai binges"
  )

  # echo '\033[1;35m
  # ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿
  # ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣮⠉⠛⠻⠿⠟⠛⠉⠉⠀⠀⠀⠀⢸⣿⣿⣿
  # ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⠿⣛⣭⣶⣷⡶⢶⣄⡀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿
  # ⣿⣿⣿⣿⠿⠋⠉⠀⠈⢻⣿⣿⣿⣿⡆⠀⠀⠀⠀⣰⣾⣿⡿⣻⣿⣿⣷⡿⣻⣿⡿⢩⣾⣿⡿⣿⣷⣄⠀⠀⠀⠀⢰⣿⣿⣿⣿
  # ⣿⣿⡟⠁⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⡇⠀⠀⣰⣿⣿⡿⢋⣾⣿⣿⠟⣩⣾⡿⣡⣴⣿⡟⢸⡇⢻⣿⣿⣷⡄⠀⠀⣾⣿⣿⣿⣿
  # ⣿⠟⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⡇⢀⣾⣿⣿⡿⢡⣿⣿⡿⢋⣼⣿⠏⣴⣿⣿⠏⢀⣿⢣⡌⢿⣧⠙⣿⡀⢸⣿⣿⣿⣿⣿
  # ⡟⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⡏⠀⣼⣿⡿⣹⢡⢻⣿⠟⢡⣾⠿⡁⣼⣿⠿⢣⡎⣸⠏⣾⣷⠈⣽⡇⢸⣇⠊⣿⣿⣿⣿⣿
  # ⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⡟⠀⣸⣿⣿⢣⠇⢠⡿⠋⢰⡟⠁⣴⢱⡿⠃⣴⡿⢱⢏⣼⣿⣿⠀⠬⡭⢸⣿⠀⣿⣿⣿⣿⣿
  # ⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣋⡄⠠⡿⠿⡿⠘⢸⡗⣠⡁⠫⢀⣼⡇⡿⣡⣼⡿⠁⢣⣾⣿⣿⣿⢰⣾⡟⣼⣿⡆⣿⣿⣿⣿⣿
  # ⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⡇⠃⡇⠀⢠⡄⠀⣀⠉⠀⠀⠀⠉⠁⠰⠿⠟⠁⠀⣫⣭⣶⣶⡟⣾⢹⢇⣿⢷⠇⣿⣿⣿⣿⣿
  # ⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠇⠀⠸⣼⢻⡄⣼⠁⠀⡴⣧⠀⠀⣰⠀⢠⠤⢤⡄⠀⡀⠉⠈⠀⠉⡼⠀⣿⣿⣿⣿⣿
  # ⡇⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⠏⣼⠀⠀⠀⠀⣿⠇⠘⣷⠇⠀⣼⣧⣼⡆⠀⣿⠀⣼⣤⣤⠀⢸⡇⠀⢸⡇⠀⢀⠀⢿⣿⣿⣿⣿
  # ⣿⣄⠀⠀⠀⠀⠙⢿⣿⡿⢫⠆⠃⢠⢠⠀⠀⠀⣤⣄⣉⣀⣈⠁⠀⠀⠓⠀⠟⠀⠿⠀⠀⠀⢸⣇⢀⣿⠁⢰⡟⠀⠸⣿⣿⣿⣿
  # ⣿⣿⣦⡀⠀⠀⠀⠀⠈⢡⡟⠀⡀⢸⠀⢆⢢⡀⢈⠻⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣦⣤⣤⣄⣀⠉⠉⠁⠀⠸⠁⣶⡐⣼⣿⣿⣿
  # ⣿⣿⣿⣿⣦⣀⠀⠀⠀⣸⡇⣸⣧⠸⣇⢸⠑⠌⢿⣶⣽⣿⣿⣿⠿⠛⢛⡛⠿⣿⣿⣿⣿⣿⡷⠀⣠⠟⠁⣀⠀⢹⢻⠘⢿⣿⣿
  # ⣿⣿⣿⣿⣿⣿⣿⣦⣄⢧⣁⠻⣿⣧⡙⠀⣼⣆⠀⠀⠉⣛⣿⣿⠀⣴⣶⣄⠀⣾⣿⣟⠿⠛⠁⠊⠁⢀⣼⠁⣰⠀⠘⣴⢸⣿⣿
  # ⣿⣿⣿⣿⣿⣿⣿⠟⣩⣌⠻⢷⣼⣿⣃⣴⣦⡈⠡⡄⠀⠀⠿⢿⣷⣛⠿⣓⣠⣿⡿⠟⠉⣀⡤⢂⣴⠟⠁⠰⠟⢀⠼⠡⣿⣿⣿
  # ⣿⣿⣿⣿⣿⣿⣿⠘⣿⣿⣿⣶⣤⣬⣝⣉⠉⢛⣅⢠⡅⠀⣀⠀⠉⠛⠿⠟⠋⠁⢀⣀⡊⣴⣦⣍⠰⢢⣾⣿⠆⡀⢜⠳⣭⣻⣿
  # ⣿⣿⣿⣿⣿⣿⡇⣷⢻⣿⣸⣿⣿⢩⣾⡝⢡⣿⡏⣄⠹⢰⠸⣦⣄⠀⠀⠀⠀⣴⡿⢋⠕⡈⢿⣿⢧⣿⡿⣣⣾⡿⣠⡹⣮⡻⣿
  # ⣿⣿⣿⣿⣿⣿⣧⢻⣎⣿⣇⢿⣻⣌⢿⣿⡌⢿⡏⣿⡇⡸⢠⣮⣙⡷⢶⣾⡃⡟⢰⠋⣠⡦⣸⣿⢸⡟⣼⡿⢋⣾⣿⣧⣿⣷⢹
  # ⣿⣿⣿⣿⣿⣿⣿⣸⣿⣜⣿⢨⡜⢿⣧⡻⣿⡘⣿⡌⢠⣤⣦⠘⠘⠟⠻⠿⠟⡀⠉⣾⣿⣇⢿⣿⣬⣥⡋⠴⠟⣫⣿⣿⣿⣿⣾
  # ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣘⢛⣦⡛⢷⠙⢃⣿⣿⣘⡉⣥⢸⣷⣾⣷⣼⣿⢏⡀⠻⣿⣿⣮⡛⠿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿
  # ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
  # \033[0m'

  # echo '\033[1;35m
  # ⠄⠄⠄⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄
  # ⠄⠄⠄⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄
  # ⠄⠄⢀⡋⣡⣴⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄
  # ⠄⠄⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄
  # ⠄⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰
  # ⠄⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤
  # ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗
  # ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠄
  # ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠄
  # ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃⠄
  # ⠄⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃⠄⠄
  # ⠄⠄⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁⠄⠄⠄
  # \033[0m'

  # echo

  if [ ${#messages[@]} -gt 0 ]; then
    echo "\033[1m${messages[$((RANDOM % ${#messages[@]} + 1))]}\033[0m"
  fi
}

startup_sequence

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.private/.private.zsh ] && source ~/.private/.private.zsh
[ -f ~/.work/.work.zsh ] && source ~/.work/.work.zsh
