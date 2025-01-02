#!/bin/bash

set -e

echo "=> Starting dotfiles installation..."

if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Please install npm first."
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "git is not installed. Please install git first."
    exit 1
fi

if ! command -v fortune &> /dev/null; then
    echo "fortune is not installed. Please install fortune first."
    exit 1
fi

echo "=> Installing yarn globally..."
npm i -g yarn@latest

echo "=> Cloning dotfiles repository..."
git clone git@github.com:dorukozerr/dotfiles.git ~/kawaiDotfiles

backup_dir="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "=> Creating backup directory at $backup_dir"
mkdir -p "$backup_dir"
for file in ~/.vim ~/.vimrc ~/.config/tmux ~/.scripts ~/.zshrc; do
    if [ -e "$file" ]; then
        echo "=> Backing up $file"
        mv "$file" "$backup_dir/"
    fi
done

mkdir -p ~/.vim/pack/plugins/start

echo "=> Installing Vim plugins..."
cat > ~/.vim/temp.vimrc << 'EOF'
set nocompatible
set hidden
set updatetime=100
let g:coc_disable_startup_warning = 1
EOF

cd ~/.vim/pack/plugins/start

git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/junegunn/fzf.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/neoclide/coc.nvim.git
git clone https://github.com/cohama/lexima.vim.git
git clone https://github.com/ryanoasis/vim-devicons.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/edkolev/tmuxline.vim.git

cd coc.nvim
npm ci
cd ..
cd fzf
./install --all
cd ~

echo "=> Installing CoC extensions..."
yes | vim -u ~/.vim/temp.vimrc -c 'CocInstall -sync coc-tsserver coc-eslint coc-vimlsp coc-json coc-css @yaegassy/coc-tailwindcss3 coc-go coc-prettier' -c 'qall!' > /dev/null 2>&1

rm ~/.vim/temp.vimrc

echo "=> Setting up full Vim configuration..."
mv ~/kawaiDotfiles/vim/* ~/.vim
mv ~/.vim/keta.vim ~/.vim/pack/plugins/start/vim-airline-themes/autoload/airline/themes

echo "=> Setting up Tmux..."
mkdir -p ~/.config
mv ~/kawaiDotfiles/tmux ~/.config/

echo "=> Setting up scripts..."
mv ~/kawaiDotfiles/scripts ~/.scripts
chmod +x ~/.scripts/commit.sh
chmod +x ~/.scripts/lazygrep.sh

echo "=> Setting up Zsh..."
mv ~/kawaiDotfiles/zsh/.zshrc ~/

echo "=> Cleaning up..."
rm -rf ~/kawaiDotfiles

echo "=> Installation complete! A backup of your previous configuration can be found in $backup_dir"
echo "=> Please restart your terminal for all changes to take effect."
