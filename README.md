# My dotfiles

-   Install script will backup your `~/.vimrc`, `~/.vim/`, `~/.zshrc`, `~/.config/tmux/`, `~/.scripts/` files and folders to `~/dotfiles_backup_<timestamp>/` folder and installs my settings. I did this to install my environment but you can use also if you want >.<
-   I only did this on macos I don't know if it is compatible with other OS's, but it should be compatible with linux I guess but I didn't tested it.
-   My cli based [todo app](https://github.com/dorukozerr/todo-app) being used in zshrc file. Either install it or remove that part from zshrc.

## Installation

```bash
curl -o- https://raw.githubusercontent.com/dorukozerr/dotfiles/main/install.sh | bash
```

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
| <kbd>ctrl</kbd> <kbd>p</kbd>                              | Fzf file search                     | `n`  |
| <kbd>ctrl</kbd> <kbd>f</kbd>                              | Fzf grep search                     | `n`  |
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
| Text           | `#E2D8DC`  | ![#E2D8DC](https://placehold.co/30/E2D8DC/E2D8DC) |
| Bold Text      | `#F7F0F3`  | ![#F7F0F3](https://placehold.co/30/F7F0F3/F7F0F3) |
| Cursor         | `#85A7A5`  | ![#85A7A5](https://placehold.co/30/85A7A5/85A7A5) |
| Selection      | `#3D4757`  | ![#3D4757](https://placehold.co/30/3D4757/3D4757) |
| Normal Black   | `#0F0F0F`  | ![#0F0F0F](https://placehold.co/30/0F0F0F/0F0F0F) |
| Normal Red     | `#C47B7B`  | ![#C47B7B](https://placehold.co/30/C47B7B/C47B7B) |
| Normal Green   | `#B17F92`  | ![#B17F92](https://placehold.co/30/B17F92/B17F92) |
| Normal Yellow  | `#A898B7`  | ![#A898B7](https://placehold.co/30/A898B7/A898B7) |
| Normal Blue    | `#8BA499`  | ![#8BA499](https://placehold.co/30/8BA499/8BA499) |
| Normal Magenta | `#B48EAD`  | ![#B48EAD](https://placehold.co/30/B48EAD/B48EAD) |
| Normal Cyan    | `#A4B49E`  | ![#A4B49E](https://placehold.co/30/A4B49E/A4B49E) |
| Normal White   | `#E8E8E8`  | ![#E8E8E8](https://placehold.co/30/E8E8E8/E8E8E8) |
| Bright Black   | `#232323`  | ![#232323](https://placehold.co/30/232323/232323) |
| Bright Red     | `#E19191`  | ![#E19191](https://placehold.co/30/E19191/E19191) |
| Bright Green   | `#CFA1B4`  | ![#CFA1B4](https://placehold.co/30/CFA1B4/CFA1B4) |
| Bright Yellow  | `#C2B0D6`  | ![#C2B0D6](https://placehold.co/30/C2B0D6/C2B0D6) |
| Bright Blue    | `#A3C0B6`  | ![#A3C0B6](https://placehold.co/30/A3C0B6/A3C0B6) |
| Bright Magenta | `#CCA5C9`  | ![#CCA5C9](https://placehold.co/30/CCA5C9/CCA5C9) |
| Bright Cyan    | `#BCCBB6`  | ![#BCCBB6](https://placehold.co/30/BCCBB6/BCCBB6) |
| Bright White   | `#FFFFFF`  | ![#FFFFFF](https://placehold.co/30/FFFFFF/FFFFFF) |
