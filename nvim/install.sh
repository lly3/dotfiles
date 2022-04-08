#!/bin/sh

# language server
sudo pacman -S --noconfirm npm clang
sudo npm i -g bash-language-server typescript typescript-language-server pyright

# neovim config
mkdir -p ~/.config/nvim && cp -rf . ~/.config/nvim && rm ~/.config/nvim/init.vim
python3 -m pip install --user --upgrade pynvim

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME}"/.config/nvim/autoload/plug.vim --create-dir \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +source vim-plug/plugins.vim +PlugInstall +qall && cp init.vim ~/.config/nvim

rm ~/.config/nvim/install.sh
