#!/bin/bash

sudo pacman -S git neovim xorg xorg-xinit i3-wm i3blocks dmenu j4-dmenu-desktop alacritty fish feh chromium thunar ttf-ibm-plex gcc acpi

git clone https://github.com/lucasrluz/dotfiles.git
git clone https://github.com/lucasrluz/wallpaper.git

mv dotfiles/.config/ ~/

cp /etc/X11/xinit/xinitrc ~/.xinitrc

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

echo "Adicionar i3 ao .xinitrc"
