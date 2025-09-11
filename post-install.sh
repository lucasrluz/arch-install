#!/bin/bash

sudo pacman -S git neovim xorg xorg-xinit i3-wm i3blocks j4-dmenu-desktop alacritty feh chromium thunar ttf-ibm-plex

cp /etc/X11/xinit/xinitrc ~/.xinitrc

echo "Adicionar i3 ao .xinitrc"
