#!/bin/bash

# Hora
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Localização
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
echo "archlinux" > /etc/hostname

sleep 1

# Senha root e criação de usuário
passwd

useradd -m -G wheel -s /bin/bash lucas
passwd lucas

sleep 1

# GRUB
pacman -S grub efibootmgr

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg

# NetworkManager
pacman -S networkmanager
systemctl enable NetworkManager

echo "Instalação com chroot finalizada"
echo "Usuário deve ser adicionado ao sudo!"














