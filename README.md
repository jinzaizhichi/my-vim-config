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

| Keys                                                      | Description                         | Mode |
| :-------------------------------------------------------- | :---------------------------------- | :--- |
| <kbd>ctrl</kbd> <kbd>j</kbd>                              | Open coc autocomplete suggestions   | `i`  |
| <kbd>ctrl</kbd> <kbd>k</kbd> <kbd>ctrl</kbd> <kbd>i</kbd> | Coc do hover                        | `ì`  |
| <kbd>ctrl</kbd> <kbd>k</kbd> <kbd>ctrl</kbd> <kbd>i</kbd> | Coc do hover                        | `n`  |
| <kbd>g</kbd> <kbd>d</kbd>                                 | Coc open definition in split        | `n`  |
| <kbd>g</kbd> <kbd>t</kbd>                                 | Coc open type definition in split   | `n`  |
| <kbd>ctrl</kbd> <kbd>t</kbd>                              | Toggle NERDTREE                     | `n`  |
| <kbd>ctrl</kbd> <kbd>p</kbd>                              | Open fzf                            | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>n</kbd>               | Go to next buffer (buffer next)     | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>p</kbd>               | Go to prev buffer (buffer prev)     | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>c</kbd>               | Close all buffers except active one | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Increase pane width                 | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Decrease pane width                 | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Increase pane height                | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Decrease pane height                | `n`  |
| <kbd>leader</kbd> <kbd>s</kbd>                            | Save buffer                         | `n`  |

## Keta Theme

A soft, pastel color scheme named after my cat, featuring gentle pinks and greens.

| Label          | Color Code | Preview                                           |
| :------------- | :--------- | :------------------------------------------------ |
| Background     | `#030303`  | ![#030303](https://placehold.co/30/030303/030303) |
| Text           | `#D1D5DB`  | ![#D1D5DB](https://placehold.co/30/D1D5DB/D1D5DB) |
| Bold Text      | `#F3F4F6`  | ![#F3F4F6](https://placehold.co/30/F3F4F6/F3F4F6) |
| Cursor         | `#85A7A5`  | ![#85A7A5](https://placehold.co/30/85A7A5/85A7A5) |
| Selection      | `#3D4757`  | ![#3D4757](https://placehold.co/30/3D4757/3D4757) |
| Normal Black   | `#0F0F0F`  | ![#0F0F0F](https://placehold.co/30/0F0F0F/0F0F0F) |
| Normal Red     | `#C47B7B`  | ![#C47B7B](https://placehold.co/30/C47B7B/C47B7B) |
| Normal Green   | `#909D63`  | ![#909D63](https://placehold.co/30/909D63/909D63) |
| Normal Yellow  | `#A898B7`  | ![#A898B7](https://placehold.co/30/A898B7/A898B7) |
| Normal Blue    | `#8BA499`  | ![#8BA499](https://placehold.co/30/8BA499/8BA499) |
| Normal Magenta | `#B48EAD`  | ![#B48EAD](https://placehold.co/30/B48EAD/B48EAD) |
| Normal Cyan    | `#A4B49E`  | ![#A4B49E](https://placehold.co/30/A4B49E/A4B49E) |
| Normal White   | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
| Bright Black   | `#232323`  | ![#232323](https://placehold.co/30/232323/232323) |
| Bright Red     | `#E19191`  | ![#E19191](https://placehold.co/30/E19191/E19191) |
| Bright Green   | `#A8B777`  | ![#A8B777](https://placehold.co/30/A8B777/A8B777) |
| Bright Yellow  | `#C2B0D6`  | ![#C2B0D6](https://placehold.co/30/C2B0D6/C2B0D6) |
| Bright Blue    | `#A3C0B6`  | ![#A3C0B6](https://placehold.co/30/A3C0B6/A3C0B6) |
| Bright Magenta | `#CCA5C9`  | ![#CCA5C9](https://placehold.co/30/CCA5C9/CCA5C9) |
| Bright Cyan    | `#BCCBB6`  | ![#BCCBB6](https://placehold.co/30/BCCBB6/BCCBB6) |
| Bright White   | `#FFFFFF`  | ![#FFFFFF](https://placehold.co/30/FFFFFF/FFFFFF) |
