# My dotfiles

Installation Steps

-   Clone the repo `git clone git@github.com:dorukozerr/dotfiles.git ~/kawaiDotfiles`

1. Vim
    1. Remove or backup your `~/.vim` folder, to remove it run `rm -rf ~/.vim`
    2. Run `mv ~/kawaiDotfiles/vim ~/.vim && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`.
    3. Then enter vim and type `:PlugInstall`.
    4. Inside Vim run `:CocInstall coc-tsserver coc-eslint coc-vimlsp coc-json coc-css @yaegassy/coc-tailwindcss3 coc-go` to install my most used coc LSPs for web dev.
    5. Extras
        - I created a custom airline theme to match my terminal theme. It's already configured in my airline settings file, to use it just run this command `mv ~/.vim/relaxed.vim ~/.vim/plugged/vim-airline-themes/autoload/airline/themes`. I think it looks nice. Or you can just change the airline theme in `~/.vim/config/airline.vim` to `let g:airline_theme='minimalist'`.
        - You need fortune to use this setup. Install it or remove `startscreen.vim` from `vimrc` file, and delete file from `~/.vim/config` folder.
2. Tmux
    1. Clear tmux config file if you have one `rm -rf ~/.config/tmux`.
    2. Run `mv ~/kawaiDotfiles/tmux ~/.config`.
3. Scripts
    1. Remove `~/.scripts` folder if you have it.
    2. Run `mv ~/kawaiDotfiles/scripts ~/.scripts`.
    3. Make scripts executable with `chmod +x ~/.scripts/commit.sh && chmod +x ~/.scripts/custom_grep.sh`.
    4. Add alliases to your `~/.bashrc` or `~/.zshrc` files to run them, you can check my zsh config for how to add them. Or skip this if you gonna use my zsh config because they are already added there.
4. Zsh
    1. Install lolcat or remove the ASCII echo in config
    2. My cli based [todo app](https://github.com/dorukozerr/todo-app) is used in zsh config, install it or remove the related content from config.
    3. Remove or backup your `/.zshrc` file, to remove it run `rm ~/.zshrc`.
    4. Run `mv ~/kawaiDotfiles/zsh/.zshrc ~/`.
    5. Source the file `source ~/.zshrc`.
5. Final notes
    - Don't forget to remove the git repo after you're done with everything `rm -rf ~/kawaiDotfiles`.
    - I use this [terminal theme](https://github.com/lysyi3m/macos-terminal-themes/blob/master/themes/Relaxed.terminal), if you are not on default macos terminal app search gogh terminal themes and inside it search relaxed theme they support almost every terminal for installation themes.
    - I use fira code mono nerd fonts.
    - Hope you liked it >.<

![screenshot](ss-1.png)
![screenshot](ss-2.png)

### Vim shortcuts configured manually

-   Leader key is remapped to space.

| Keys                                                      | Description                           | Mode |
| :-------------------------------------------------------- | :------------------------------------ | :--- |
| <kbd>ctrl</kbd> <kbd>j</kbd>                              | Open coc autocomplete suggestions     | `i`  |
| <kbd>ctrl</kbd> <kbd>k</kbd> <kbd>ctrl</kbd> <kbd>i</kbd> | Coc do hover                          | `ì`  |
| <kbd>ctrl</kbd> <kbd>k</kbd> <kbd>ctrl</kbd> <kbd>i</kbd> | Coc do hover                          | `n`  |
| <kbd>g</kbd> <kbd>d</kbd>                                 | Coc open definition in split          | `n`  |
| <kbd>g</kbd> <kbd>t</kbd>                                 | Coc open type definition in split     | `n`  |
| <kbd>ctrl</kbd> <kbd>t</kbd>                              | Toggle NERDTREE                       | `n`  |
| <kbd>ctrl</kbd> <kbd>p</kbd>                              | Open fzf                              | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>n</kbd>               | Go to next buffer (buffer next)       | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>p</kbd>               | Go to prev buffer (buffer prev)       | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Increase pane width                   | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Decrease pane width                   | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Increase pane height                  | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Decrease pane height                  | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>t</kbd>               | Toggle floating terminal              | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>c</kbd>               | Create floating terminal instance     | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>n</kbd>               | Go to next floating terminal instance | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>p</kbd>               | Go to prev floating terminal instance | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>q</kbd>               | Quit/Close floating terminal          | `n`  |
