#!/bin/bash

# Hora
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

# Localização
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf
echo "archlinux" > /etc/hostname

# Senha root e criação de usuário
passwd

useradd -m -G wheel -s /bin/bash lucas
passwd lucas
