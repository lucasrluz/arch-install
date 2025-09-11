#!/bin/bash

sudo pacman -S git neovim xorg xorg-xinit i3-wm i3blocks dmenu j4-dmenu-desktop alacritty fish feh chromium thunar ttf-ibm-plex gcc

git clone https://github.com/lucasrluz/dotfiles.git

mv dotfiles/.config/ ~/

cp /etc/X11/xinit/xinitrc ~/.xinitrc

echo "Adicionar i3 ao .xinitrc"
