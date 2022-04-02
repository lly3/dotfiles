#!/bin/sh
# my install script for pacman on arch linux w/ systemd

# set keyboard layout
echo "KEYMAP=colemak" >> /etc/vconsole.conf

sudo pacman -Syu
sudo pacman -S git

# zsh
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # ohmyzsh

sudo chsh -s /bin/zsh

# fonts
sudo pacman -S noto-fonts
sudo pacman -S ttf-anonymous-pro
sudo pacman -S ttf-nerd-fonts-symbols

# alacritty & picom
sudo pacman -S alacritty
sudo pacman -S picom

# make install dwm st dmenu
sudo pacman -S make
sudo mv ./{dwm,st,dmenu} /usr/src/
cd /usr/src/dwm && sudo make clean install
cd /usr/src/st && sudo make clean install
cd /usr/src/dmenu && sudo make clean install

mv ./.xinitrc ~/

# set up wallpaper
sudo pacman -S feh
mv ./wallpaper/83106977_p0.jpg ~/Pictures

