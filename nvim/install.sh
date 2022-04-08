#!/bin/sh

sudo pacman -S --noconfirm npm
sudo npm i -g bash-language-server typescript typescript-language-server pyright

mkdir -p ~/.config/nvim && cp -rf . ~/.config/nvim
python3 -m pip install --user --upgrade pynvim
