# My little vim setup

-   You need fortune to use this setup. Install it or remove `startscreen.vim` from `vimrc` file.
-   To use my vim config fallow these instructions. First run `git clone https://github.com/dorukozerr/my-vim-config.git ~/.vim && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && rm -rf ~/.vim/.git ~/.vim/.gitignore`.
-   Then enter vim and type `:PlugInstall`.
-   Run `:CocInstall coc-tsserver coc-eslint coc-vimlsp coc-json coc-css @yaegassy/coc-tailwindcss3` in vim to install my most used coc extensions for web dev.
-   I also created a custom airline theme to match my terminal theme. It's already configured in my airline settings file, to use it just run this command `mv ~/.vim/relaxed.vim ~/.vim/plugged/vim-airline-themes/autoload/airline/themes`. I think it looks nice. Or you can just change the airline theme in `~/.vim/config/airline.vim` to `let g:airline_theme='minimalist`.
-   I use this terminal theme `https://github.com/lysyi3m/macos-terminal-themes/blob/master/themes/Relaxed.terminal`.

And thats my vim setup.

I created this repo to install my config on my other machines easily, also record the changes of my config.

Run this command after installation thoose files somehow slows down or even breaks vim when they are present in .vim folder `rm -rf ~/.vim/README.md ~/.vim/vim-ss-1.jpeg ~/.vim/vim-ss-2.jpeg ~/.vim/vim-ss-3.jpeg ~/.vim/relaxed.vim` or maybe its .git repo I dont know the exact reason behind this but we remove .git and .gitignore in the first clone command.

![screenshot](vim-ss-1.jpeg)
![screenshot](vim-ss-2.jpeg)
![screenshot](vim-ss-3.jpeg)
