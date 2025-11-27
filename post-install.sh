#!/bin/bash

sudo pacman -S git neovim xorg xorg-xinit i3-wm i3blocks dmenu j4-dmenu-desktop alacritty fish feh chromium thunar ttf-ibm-plex gcc acpi tlp

git clone https://github.com/lucasrluz/dotfiles.git
git clone https://github.com/lucasrluz/wallpaper.git

mv dotfiles/.config/ ~/

cp /etc/X11/xinit/xinitrc ~/.xinitrc

sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

sudo systemctl enable tlp.service
sudo systemctl start tlp.service
sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket

cp dotfiles/etc/tlp.conf /etc/tlp.conf

sudo tlp start

cp dotfiles/etc/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

echo "Adicionar i3 ao .xinitrc"
