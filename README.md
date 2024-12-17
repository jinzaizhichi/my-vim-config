# My dotfiles

## Installation Steps

-   Clone the repo `git clone git@github.com:dorukozerr/dotfiles.git ~/kawaiDotfiles`.
-   You need yarn for installing vim plugins, just run `npm i -g yarn` if you don't have it.

1. Vim
    1. Remove or backup your `~/.vim` folder, to remove it run `rm -rf ~/.vim`.
    2. Run `mv ~/kawaiDotfiles/vim ~/.vim && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`.
    3. Then enter vim and type `:PlugInstall`.
    4. Inside Vim run `:CocInstall coc-tsserver coc-eslint coc-vimlsp coc-json coc-css @yaegassy/coc-tailwindcss3 coc-go` to install my most used coc LSPs for web dev.
    5. Extras
        - I created a custom airline theme to match my terminal theme. It's already configured in my airline settings file, to use it just run this command `mv ~/.vim/keta.vim ~/.vim/plugged/vim-airline-themes/autoload/airline/themes`. I think it looks nice. Or you can just change the airline theme in `~/.vim/config/airline.vim` to `let g:airline_theme='minimalist'`.
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
    1. My cli based [todo app](https://github.com/dorukozerr/todo-app) is used in zsh config, install it or remove the related content from config.
    2. Remove or backup your `/.zshrc` file, to remove it run `rm ~/.zshrc`.
    3. Run `mv ~/kawaiDotfiles/zsh/.zshrc ~/`.
    4. Source the file `source ~/.zshrc`.
5. Final notes
    - Don't forget to remove the git repo after you're done with everything `rm -rf ~/kawaiDotfiles`.
    - I created a custom terminal theme, you can copy to colors from below if you like it.
    - I use fira code mono nerd fonts.
    - Hope you liked it >.<

![screenshot](ss-1.png)
![screenshot](ss-2.png)

## Vim shortcuts configured manually

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
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>c</kbd>               | Close all buffers except active one   | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Increase pane width                   | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Decrease pane width                   | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Increase pane height                  | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Decrease pane height                  | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>t</kbd>               | Toggle floating terminal              | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>c</kbd>               | Create floating terminal instance     | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>n</kbd>               | Go to next floating terminal instance | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>p</kbd>               | Go to prev floating terminal instance | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd> <kbd>q</kbd>               | Quit/Close floating terminal          | `n`  |
| <kbd>leader</kbd> <kbd>s</kbd>                            | Save buffer                           | `n`  |

## Keta Theme

A soft, pastel color scheme named after my cat, featuring gentle pinks and greens.

| Label          | Color Code | Preview                                           |
| :------------- | :--------- | :------------------------------------------------ |
| Background     | `#0D0D0D`  | ![#0D0D0D](https://placehold.co/30/0D0D0D/0D0D0D) |
| Text           | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
| Bold Text      | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
| Cursor         | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
| Selection      | `#B48EAD`  | ![#B48EAD](https://placehold.co/30/B48EAD/B48EAD) |
| Normal Black   | `#1E1E1E`  | ![#262626](https://placehold.co/30/1E1E1E/1E1E1E) |
| Normal Red     | `#C47B7B`  | ![#C47B7B](https://placehold.co/30/C47B7B/C47B7B) |
| Normal Green   | `#909D63`  | ![#909D63](https://placehold.co/30/909D63/909D63) |
| Normal Yellow  | `#C4B27B`  | ![#C4B27B](https://placehold.co/30/C4B27B/C4B27B) |
| Normal Blue    | `#9B6B8F`  | ![#9B6B8F](https://placehold.co/30/9B6B8F/9B6B8F) |
| Normal Magenta | `#B48EAD`  | ![#B48EAD](https://placehold.co/30/B48EAD/B48EAD) |
| Normal Cyan    | `#A4B49E`  | ![#A4B49E](https://placehold.co/30/A4B49E/A4B49E) |
| Normal White   | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
| Bright Black   | `#141414`  | ![#363636](https://placehold.co/30/141414/141414) |
| Bright Red     | `#C47B7B`  | ![#C47B7B](https://placehold.co/30/C47B7B/C47B7B) |
| Bright Green   | `#909D63`  | ![#909D63](https://placehold.co/30/909D63/909D63) |
| Bright Yellow  | `#C4B27B`  | ![#C4B27B](https://placehold.co/30/C4B27B/C4B27B) |
| Bright Blue    | `#9B6B8F`  | ![#9B6B8F](https://placehold.co/30/9B6B8F/9B6B8F) |
| Bright Magenta | `#B48EAD`  | ![#B48EAD](https://placehold.co/30/B48EAD/B48EAD) |
| Bright Cyan    | `#A4B49E`  | ![#A4B49E](https://placehold.co/30/A4B49E/A4B49E) |
| Bright White   | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
