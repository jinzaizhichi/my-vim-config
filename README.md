# Dotfiles

Configurations for vim, tmux, zsh, git, and WezTerm. Uses Vim's native plugin management.

## Requirements

- git
- npm
- fzf, bat, ripgrep, the_silver_searcher, perl, universal-ctags

Install on macOS:

```bash
brew install git npm fzf bat ripgrep the_silver_searcher perl universal-ctags
```

## Installation

```bash
curl -o- https://raw.githubusercontent.com/dorukozerr/dotfiles/main/install.sh | bash
```

This backs up existing configs to ~/dotfiles*backup*<timestamp>/ (including ~/.vimrc, ~/.vim/, ~/.zshrc, ~/.zprofile, ~/.config/tmux/, ~/.scripts/, ~/.gitconfig), sets up all configurations, and installs plugins.

## Vim Plugins

### Core

- vim-fugitive: Git integration
- fzf & fzf.vim: Fuzzy finding
- FastFold: Folding optimization

### Development

- coc.nvim: Intellisense
- kisuke.vim: AI coding assistant
- vim-jsx-pretty: JSX support
- vim-matchit: Jump to opposite tags
- vim-visual-multi: Multi cursor editing

### Visual

- vim-airline: Status bar
- vim-airline-themes: Themes including Keta
- vim-devicons: Filetype icons

### CoC Extensions

Language servers: coc-vimlsp, coc-sh, coc-tsserver, coc-go, coc-html, coc-css, coc-json, coc-yaml, coc-lua, coc-sql, coc-svg

Tools: coc-prettier, coc-eslint, coc-dotenv, @yaegassy/coc-tailwindcss3

Plugins install automatically. Run :helptags ALL after setup.

## Additional Vim Features

- GitStats: Shows branch changes (+lines, -lines, modified files) in status bar, updates on write/enter/leave.
- Lorem <count>: Inserts <count> words of lorem ipsum text.
- CleanFileLineEndings (<leader>cfe): Fixes encodings, removes CR, non-ASCII, sets unix format.
- GoImportsOnSave: Auto-organizes Go imports on save.

## Important Notes

- Update ~/.gitconfig with your name and email.
- Set terminal to Psychosis theme colors (below) for consistent vim/tmux appearance.

## Psychosis Theme

| Label          | Color Code | Preview                                           |
| :------------- | :--------- | :------------------------------------------------ |
| Background     | #000000    | ![#000000](https://placehold.co/30/000000/000000) |
| Text           | #F4F4F4    | ![#F4F4F4](https://placehold.co/30/F4F4F4/F4F4F4) |
| Bold Text      | #F4F4F4    | ![#F4F4F4](https://placehold.co/30/F4F4F4/F4F4F4) |
| Cursor         | #AB3FB1    | ![#AB3FB1](https://placehold.co/30/AB3FB1/AB3FB1) |
| Selection      | #606060    | ![#606060](https://placehold.co/30/606060/606060) |
| Normal Black   | #000000    | ![#000000](https://placehold.co/30/000000/000000) |
| Normal Red     | #CB2F2D    | ![#CB2F2D](https://placehold.co/30/CB2F2D/CB2F2D) |
| Normal Green   | #9000EE    | ![#9000EE](https://placehold.co/30/9000EE/9000EE) |
| Normal Yellow  | #AB3FB1    | ![#AB3FB1](https://placehold.co/30/AB3FB1/AB3FB1) |
| Normal Blue    | #B7306E    | ![#B7306E](https://placehold.co/30/B7306E/B7306E) |
| Normal Magenta | #52D283    | ![#52D283](https://placehold.co/30/52D283/52D283) |
| Normal Cyan    | #7DD275    | ![#7DD275](https://placehold.co/30/7DD275/7DD275) |
| Normal White   | #F4F4F4    | ![#F4F4F4](https://placehold.co/30/F4F4F4/F4F4F4) |
| Bright Black   | #606060    | ![#606060](https://placehold.co/30/606060/606060) |
| Bright Red     | #F3BDB9    | ![#F3BDB9](https://placehold.co/30/F3BDB9/F3BDB9) |
| Bright Green   | #CAA7EA    | ![#CAA7EA](https://placehold.co/30/CAA7EA/CAA7EA) |
| Bright Yellow  | #DE99E3    | ![#DE99E3](https://placehold.co/30/DE99E3/DE99E3) |
| Bright Blue    | #F0A1C7    | ![#F0A1C7](https://placehold.co/30/F0A1C7/F0A1C7) |
| Bright Magenta | #C6EED9    | ![#C6EED9](https://placehold.co/30/C6EED9/C6EED9) |
| Bright Cyan    | #CDFFC9    | ![#CDFFC9](https://placehold.co/30/CDFFC9/CDFFC9) |
| Bright White   | #F4F4F4    | ![#F4F4F4](https://placehold.co/30/F4F4F4/F4F4F4) |

---

![screenshot](ss-1.png)
![screenshot](ss-2.png)
![screenshot](ss-3.png)

---

## Vim Keyboard Shortcuts

### Navigation & Editing

| Keys                        | Description              | Mode |
| :-------------------------- | :----------------------- | :--- |
| <kbd>Space</kbd>            | Leader key               | n    |
| <kbd>j</kbd> <kbd>k</kbd>   | Exit insert mode         | i    |
| <kbd>j</kbd> / <kbd>k</kbd> | Move down/up (with wrap) | n    |
| <kbd>y</kbd> / <kbd>Y</kbd> | Copy to system clipboard | n/v  |

### File & Buffer

| Keys                                                     | Description               | Mode |
| :------------------------------------------------------- | :------------------------ | :--- |
| <kbd>Leader</kbd> <kbd>s</kbd>                           | Save buffer               | n    |
| <kbd>Leader</kbd> <kbd>t</kbd>                           | Open explorer (Netrw)     | n    |
| <kbd>Leader</kbd> <kbd>p</kbd>                           | Find files (FZF)          | n    |
| <kbd>Leader</kbd> <kbd>f</kbd>                           | Search files (Ripgrep)    | n    |
| <kbd>Leader</kbd> <kbd>b</kbd> <kbd>b</kbd>              | Browse buffers            | n    |
| <kbd>Leader</kbd> <kbd>b</kbd> <kbd>n</kbd>              | Next buffer               | n    |
| <kbd>Leader</kbd> <kbd>b</kbd> <kbd>p</kbd>              | Previous buffer           | n    |
| <kbd>Leader</kbd> <kbd>b</kbd> <kbd>d</kbd> <kbd>c</kbd> | Delete current buffer     | n    |
| <kbd>Leader</kbd> <kbd>b</kbd> <kbd>d</kbd> <kbd>a</kbd> | Delete all except current | n    |
| <kbd>Leader</kbd> <kbd>b</kbd> <kbd>t</kbd>              | Toggle maximize/restore   | n    |

### Window & Pane

| Keys                                                     | Description           | Mode |
| :------------------------------------------------------- | :-------------------- | :--- |
| <kbd>Leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>w</kbd> | Increase width (+10)  | n    |
| <kbd>Leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>w</kbd> | Decrease width (-10)  | n    |
| <kbd>Leader</kbd> <kbd>i</kbd> <kbd>p</kbd> <kbd>h</kbd> | Increase height (+10) | n    |
| <kbd>Leader</kbd> <kbd>d</kbd> <kbd>p</kbd> <kbd>h</kbd> | Decrease height (-10) | n    |

### Git (Fugitive)

| Keys                                        | Description       | Mode |
| :------------------------------------------ | :---------------- | :--- |
| <kbd>Leader</kbd> <kbd>g</kbd> <kbd>s</kbd> | Status            | n    |
| <kbd>Leader</kbd> <kbd>g</kbd> <kbd>a</kbd> | Add all           | n    |
| <kbd>Leader</kbd> <kbd>g</kbd> <kbd>c</kbd> | Commit (vertical) | n    |
| <kbd>Leader</kbd> <kbd>g</kbd> <kbd>p</kbd> | Push              | n    |
| <kbd>Leader</kbd> <kbd>g</kbd> <kbd>d</kbd> | Diff (vertical)   | n    |
| <kbd>Leader</kbd> <kbd>g</kbd> <kbd>l</kbd> | Log (vertical)    | n    |

### Code (CoC)

| Keys                                                        | Description                  | Mode  |
| :---------------------------------------------------------- | :--------------------------- | :---- |
| <kbd>g</kbd> <kbd>d</kbd>                                   | Definition                   | n     |
| <kbd>g</kbd> <kbd>t</kbd>                                   | Type definition              | n     |
| <kbd>Ctrl</kbd> <kbd>j</kbd>                                | Trigger completion           | i     |
| <kbd>Ctrl</kbd> <kbd>k</kbd> <kbd>Ctrl</kbd> <kbd>i</kbd>   | Hover docs                   | n/i   |
| <kbd>Ctrl</kbd> <kbd>f</kbd> / <kbd>Ctrl</kbd> <kbd>b</kbd> | Scroll floats                | n/i/v |
| <kbd>Leader</kbd> <kbd>c</kbd> <kbd>c</kbd> <kbd>d</kbd>    | Copy definition to clipboard | n     |

### AI (Kisuke)

| Keys                                                     | Description                  | Mode |
| :------------------------------------------------------- | :--------------------------- | :--- |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>o</kbd>              | Open interface               | n    |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>r</kbd> <kbd>s</kbd> | Resume last session          | n    |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>m</kbd>              | Mark file for context        | n    |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>h</kbd>              | Mark highlighted for context | v    |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>r</kbd> <kbd>c</kbd> | Remove last marked block     | n    |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>c</kbd>              | New session                  | n    |
| <kbd>Leader</kbd> <kbd>k</kbd> <kbd>d</kbd>              | Delete session               | n    |

### Search & Replace

| Keys                                        | Description                        | Mode |
| :------------------------------------------ | :--------------------------------- | :--- |
| <kbd>Leader</kbd> <kbd>w</kbd> <kbd>r</kbd> | Replace word under cursor globally | n    |
| <kbd>Leader</kbd> <kbd>p</kbd> <kbd>r</kbd> | Replace highlighted with input     | v    |
| <kbd>Leader</kbd> <kbd>p</kbd> <kbd>a</kbd> | Append to highlighted pattern      | v    |
| <kbd>n</kbd> / <kbd>N</kbd>                 | Next/previous result (centered)    | n    |

### Man Pages

| Keys                                        | Description                             | Mode          |
| :------------------------------------------ | :-------------------------------------- | :------------ |
| <kbd>Leader</kbd> <kbd>m</kbd> <kbd>s</kbd> | Start man page search (then enter name) | n             |
| <kbd>Enter</kbd>                            | Open page under cursor                  | search buffer |

### Other

| Keys                                                     | Description                  | Mode |
| :------------------------------------------------------- | :--------------------------- | :--- |
| <kbd>Leader</kbd> <kbd>c</kbd> <kbd>f</kbd> <kbd>e</kbd> | Clean file encodings/formats | n    |

## Tmux Configuration

Prefix: <kbd>Ctrl</kbd> <kbd>t</kbd>. Vi mode for copy. Integrates Watchman for file watching (starts on tmux attach/create).

### Session

| Keys                           | Description  | Mode |
| :----------------------------- | :----------- | :--- |
| <kbd>Prefix</kbd> <kbd>K</kbd> | Kill session | n    |

### Copy Mode

| Keys                             | Description              | Mode |
| :------------------------------- | :----------------------- | :--- |
| <kbd>Prefix</kbd> <kbd>v</kbd>   | Enter                    | n    |
| <kbd>v</kbd>                     | Start selection          | copy |
| <kbd>V</kbd>                     | Select line              | copy |
| <kbd>Ctrl</kbd> <kbd>v</kbd>     | Rectangle toggle         | copy |
| <kbd>y</kbd>                     | Copy to clipboard & exit | copy |
| <kbd>q</kbd> / <kbd>Escape</kbd> | Exit                     | copy |

### Copy Navigation

| Keys                                                        | Description       | Mode |
| :---------------------------------------------------------- | :---------------- | :--- |
| <kbd>h</kbd> <kbd>j</kbd> <kbd>k</kbd> <kbd>l</kbd>         | Cursor movement   | copy |
| <kbd>w</kbd> / <kbd>b</kbd> / <kbd>e</kbd>                  | Word navigation   | copy |
| <kbd>0</kbd> / <kbd>$</kbd> / <kbd>^</kbd>                  | Line navigation   | copy |
| <kbd>g</kbd> / <kbd>G</kbd>                                 | Top/bottom        | copy |
| <kbd>Ctrl</kbd> <kbd>f</kbd> / <kbd>Ctrl</kbd> <kbd>b</kbd> | Page down/up      | copy |
| <kbd>Ctrl</kbd> <kbd>d</kbd> / <kbd>Ctrl</kbd> <kbd>u</kbd> | Half page down/up | copy |

### Copy Search

| Keys                        | Description             | Mode |
| :-------------------------- | :---------------------- | :--- |
| <kbd>/</kbd> / <kbd>?</kbd> | Forward/backward search | copy |
| <kbd>n</kbd> / <kbd>N</kbd> | Next/previous match     | copy |

### Panes (No Prefix)

| Keys                                                               | Description  | Mode |
| :----------------------------------------------------------------- | :----------- | :--- |
| <kbd>Alt</kbd> <kbd>h</kbd> <kbd>j</kbd> <kbd>k</kbd> <kbd>l</kbd> | Switch panes | n    |
| <kbd>Alt</kbd> <kbd>←</kbd> <kbd>→</kbd> <kbd>↑</kbd> <kbd>↓</kbd> | Resize (±5)  | n    |

## WezTerm Keyboard Shortcuts

Launches fullscreen, hides tab bar if one tab.

### Controls

| Keys                                         | Description          |
| :------------------------------------------- | :------------------- |
| <kbd>Cmd</kbd> <kbd>c</kbd>                  | Copy to clipboard    |
| <kbd>Cmd</kbd> <kbd>v</kbd>                  | Paste from clipboard |
| <kbd>Cmd</kbd> <kbd>=</kbd>                  | Increase font        |
| <kbd>Cmd</kbd> <kbd>-</kbd>                  | Decrease font        |
| <kbd>Cmd</kbd> <kbd>0</kbd>                  | Reset font           |
| <kbd>Cmd</kbd> <kbd>k</kbd> <kbd>Shift</kbd> | Clear scrollback     |
| <kbd>Cmd</kbd> <kbd>r</kbd>                  | Reload config        |
| <kbd>Cmd</kbd> <kbd>Enter</kbd>              | Toggle fullscreen    |

### Tabs & Windows

| Keys                                         | Description |
| :------------------------------------------- | :---------- |
| <kbd>Cmd</kbd> <kbd>n</kbd>                  | New tab     |
| <kbd>Cmd</kbd> <kbd>w</kbd>                  | Close tab   |
| <kbd>Cmd</kbd> <kbd>Shift</kbd> <kbd>n</kbd> | New window  |

### Tab Navigation

| Keys                                         | Description       |
| :------------------------------------------- | :---------------- |
| <kbd>Cmd</kbd> <kbd>1-9</kbd>                | Switch to tab 1-9 |
| <kbd>Cmd</kbd> <kbd>Shift</kbd> <kbd>[</kbd> | Previous tab      |
| <kbd>Cmd</kbd> <kbd>Shift</kbd> <kbd>]</kbd> | Next tab          |
