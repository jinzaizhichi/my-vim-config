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

echo "=> Setting up Tmux..."
mkdir -p ~/.config
mv ~/kawaiDotfiles/tmux ~/.config/

echo "=> Setting up scripts..."
mv ~/kawaiDotfiles/scripts ~/.scripts
chmod +x ~/.scripts/commit.sh
chmod +x ~/.scripts/lazygrep.sh
chmod +x ~/.scripts/uvp.sh
chmod +x ~/.scripts/qms_tmux.sh

echo "=> Setting up Zsh..."
mv ~/kawaiDotfiles/zsh/.zshrc ~/

echo "=> Installing Vim plugins..."
mkdir -p ~/.vim/pack/plugins/start

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
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/ryanoasis/vim-devicons.git
git clone https://github.com/dorukozerr/kisuke.vim.git
git clone https://github.com/Konfekt/FastFold.git

cd coc.nvim
npm ci
cd ..
cd fzf
./install --all
cd ..
cd kisuke.vim
yarn build
cd ~

echo "=> Installing CoC extensions..."
yes | vim -u ~/.vim/temp.vimrc -c 'CocInstall -sync coc-vimlsp coc-sh coc-tsserver coc-go coc-html coc-css @yaegassy/coc-tailwindcss3 coc-json coc-yaml coc-prettier coc-eslint coc-dotenv' -c 'qall!' > /dev/null 2>&1

echo "=> Setting up full Vim configuration..."
mv ~/kawaiDotfiles/vim/* ~/.vim
mv ~/.vim/keta.vim ~/.vim/pack/plugins/start/vim-airline-themes/autoload/airline/themes

echo "=> Cleaning up..."
rm ~/.vim/temp.vimrc
rm -rf ~/kawaiDotfiles

echo "=> Installation complete! A backup of your previous configuration can be found in $backup_dir"
echo "=> Please restart your terminal for all changes to take effect."
