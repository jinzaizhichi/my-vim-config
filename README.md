# My little vim setup

To use this git config run.

`git clone https://github.com/dorukozerr/my-vim-config.git ~/.vim && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && rm -rf ~/.vim/.git`

Just enter vim then type `:PlugInstall`.

I'm using custom base2tone-sea-dark theme on default macos terminal app. Colors are setted to t_Co=16 in my settings.
You can import `sea-dark-custom.terminal` file to use my theme if you want. Or you can simply search for base2tone terminal
themes and find the sea-dark theme. Only modification I made to theme is changed background color to pitch black `#000000`.

I also created custom airline theme to match my terminal theme. It's already configured in my airline settings file. To use
it just place seadark.vim file to `~/.vim/plugged/vim-airline-themes/autoload/airline/themes` path. I think it looks nice.

To install coc extensions run `:CocInstall coc-tsserver coc-eslint coc-vimlsp coc-json coc-css @yaegassy/coc-tailwindcss3` as vim command.

And thats my vim setup.
