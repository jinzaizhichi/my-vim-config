# My dotfiles

- Install script will backup your `~/.vimrc`, `~/.vim/`, `~/.zshrc`, `~/.zprofile`, `~/.config/tmux/`, `~/.scripts/`, `~/.gitconfig`files and folders to`~/dotfiles*backup*<timestamp>/` folder and installs my settings. I did this to install my environment but you can use also if you want >.<
- I only did this on macos I don't know if it is compatible with other OS's, but it should be compatible with linux I guess but I didn't tested it.
- My cli based [todo app](https://github.com/dorukozerr/todo-app) being used in zshrc file. Either install it or remove that part from zshrc.
- I tried to keep my vim configuration minimal as possible, instead of third party plugin managers like Vundle or vim-plug I used Vim's native solution. I also created a script to update vim plugins feel free to check it out.
- FZF plugin has some dependencies to install them run `brew install fzf bat ripgrep the_silver_searcher perl universal-ctags`.

## Vim Plugins

- [vim-fugite](https://github.com/tpope/vim-fugitive)
- [fzf](https://github.com/junegunn/fzf)
- [fzf.vim](https://github.com/junegunn/fzf.vim)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
  - [coc-vimlsp](https://www.npmjs.com/package/coc-vimlsp)
  - [coc-sh](https://www.npmjs.com/package/coc-sh)
  - [coc-tsserver](https://www.npmjs.com/package/coc-tsserver)
  - [coc-go](https://www.npmjs.com/package/coc-go)
  - [coc-html](https://www.npmjs.com/package/coc-html)
  - [coc-css](https://www.npmjs.com/package/coc-css)
  - [@yaegassy/coc-tailwindcss3](https://www.npmjs.com/package/@yaegassy/coc-tailwindcss3)
  - [coc-json](https://www.npmjs.com/package/coc-json)
  - [coc-yaml](https://www.npmjs.com/package/coc-yaml)
  - [coc-prettier](https://www.npmjs.com/package/coc-prettier)
  - [coc-eslint](https://www.npmjs.com/package/coc-eslint)
  - [coc-dotenv](https://www.npmjs.com/package/coc-dotenv)

## Installation Script

```bash
curl -o- https://raw.githubusercontent.com/dorukozerr/dotfiles/main/install.sh &> /dev/null | bash
```

### Note

- Run `:helptags ALL` to sync vim help command with installed plugins and extensions.

![screenshot](ss-1.png)
![screenshot](ss-2.png)
![screenshot](ss-3.png)
![screenshot](ss-4.png)

## Keta Theme

A soft, pastel color scheme named after my cat, featuring gentle pinks and greens.

| Label          | Color Code | Preview                                           |
| :------------- | :--------- | :------------------------------------------------ |
| Background     | `#000000`  | ![#000000](https://placehold.co/30/000000/000000) |
| Text           | `#FFFFFF`  | ![#FFFFFF](https://placehold.co/30/FFFFFF/FFFFFF) |
| Bold Text      | `#FFFFFF`  | ![#FFFFFF](https://placehold.co/30/FFFFFF/FFFFFF) |
| Cursor         | `#B56F88`  | ![#B56F88](https://placehold.co/30/B56F88/B56F88) |
| Selection      | `#808080`  | ![#808080](https://placehold.co/30/808080/808080) |
| Normal Black   | `#0A0A0A`  | ![#0A0A0A](https://placehold.co/30/0A0A0A/0A0A0A) |
| Normal Red     | `#C55A5A`  | ![#C55A5A](https://placehold.co/30/C55A5A/C55A5A) |
| Normal Green   | `#7F6D9E`  | ![#7F6D9E](https://placehold.co/30/7F6D9E/7F6D9E) |
| Normal Yellow  | `#B56F88`  | ![#B56F88](https://placehold.co/30/B56F88/B56F88) |
| Normal Blue    | `#5E8C7A`  | ![#5E8C7A](https://placehold.co/30/5E8C7A/5E8C7A) |
| Normal Magenta | `#9C6D9A`  | ![#9C6D9A](https://placehold.co/30/9C6D9A/9C6D9A) |
| Normal Cyan    | `#78997C`  | ![#78997C](https://placehold.co/30/78997C/78997C) |
| Normal White   | `#F5F5F5`  | ![#F5F5F5](https://placehold.co/30/F5F5F5/F5F5F5) |
| Bright Black   | `#141414`  | ![#141414](https://placehold.co/30/141414/141414) |
| Bright Red     | `#D77272`  | ![#D77272](https://placehold.co/30/D77272/D77272) |
| Bright Green   | `#9989B8`  | ![#9989B8](https://placehold.co/30/9989B8/9989B8) |
| Bright Yellow  | `#C7869E`  | ![#C7869E](https://placehold.co/30/C7869E/C7869E) |
| Bright Blue    | `#7AAA98`  | ![#7AAA98](https://placehold.co/30/7AAA98/7AAA98) |
| Bright Magenta | `#B784B4`  | ![#B784B4](https://placehold.co/30/B784B4/B784B4) |
| Bright Cyan    | `#93AF8A`  | ![#93AF8A](https://placehold.co/30/93AF8A/93AF8A) |
| Bright White   | `#EBEBEB`  | ![#EBEBEB](https://placehold.co/30/EBEBEB/EBEBEB) |

## Vim shortcuts configured manually

- Leader key is remapped to space.

| Keys                                                      | Description                         | Mode |
| :-------------------------------------------------------- | :---------------------------------- | :--- |
| <kbd>ctrl</kbd> <kbd>j</kbd>                              | Open coc autocomplete suggestions   | `i`  |
| <kbd>ctrl</kbd> <kbd>k</kbd> <kbd>ctrl</kbd> <kbd>i</kbd> | Coc do hover                        | `ì`  |
| <kbd>j</kbd> <kbd>k</kbd>                                 | Exit insert mode                    | `i`  |
| <kbd>ctrl</kbd> <kbd>k</kbd> <kbd>ctrl</kbd> <kbd>i</kbd> | Coc do hover                        | `n`  |
| <kbd>g</kbd> <kbd>d</kbd>                                 | Coc open definition in split        | `n`  |
| <kbd>g</kbd> <kbd>t</kbd>                                 | Coc open type definition in split   | `n`  |
| <kbd>ctrl</kbd> <kbd>f</kbd>                              | Scroll down on coc floating window  | `n`  |
| <kbd>ctrl</kbd> <kbd>b</kbd>                              | Scroll up on coc floating window    | `n`  |
| <kbd>ctrl</kbd> <kbd>f</kbd>                              | Scroll down on coc floating window  | `i`  |
| <kbd>ctrl</kbd> <kbd>b</kbd>                              | Scroll up on coc floating window    | `i`  |
| <kbd>ctrl</kbd> <kbd>f</kbd>                              | Scroll down on coc floating window  | `v`  |
| <kbd>ctrl</kbd> <kbd>b</kbd>                              | Scroll up on coc floating window    | `v`  |
| <kbd>leader</kbd> <kbd>t</kbd>                            | Open Netrw                          | `n`  |
| <kbd>leader</kbd> <kbd>p</kbd>                            | Fzf file search                     | `n`  |
| <kbd>leader</kbd> <kbd>f</kbd>                            | Fzf grep search                     | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>n</kbd>               | Go to next buffer (buffer next)     | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>p</kbd>               | Go to prev buffer (buffer prev)     | `n`  |
| <kbd>leader</kbd> <kbd>b</kbd> <kbd>c</kbd>               | Close all buffers except active one | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Increase pane width                 | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>w</kbd>  | Decrease pane width                 | `n`  |
| <kbd>leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Increase pane height                | `n`  |
| <kbd>leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>h</kbd>  | Decrease pane height                | `n`  |
| <kbd>leader</kbd> <kbd>s</kbd>                            | Save buffer                         | `n`  |
