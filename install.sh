#!/bin/sh

# my install script for pacman on arch linux w/ systemd

# set keyboard layout
echo "KEYMAP=colemak" > /etc/vconsole.conf

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git zsh noto-fonts ttf-anonymous-pro ttf-nerd-fonts-symbols alacritty picom make feh base-devel neovim

# zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # ohmyzsh

sudo chsh -s /bin/zsh

# make install dwm st dmenu
sudo mv ./{dwm,st,dmenu} /usr/src/
cd /usr/src/dwm && sudo make clean install
cd /usr/src/st && sudo make clean install
cd /usr/src/dmenu && sudo make clean install

cp ./.xinitrc ~/

# set up wallpaper
mkdir ~/Pictures && cp ./wallpaper/83106977_p0.jpg ~/Pictures

# neovim set up
./nvim/install.sh
