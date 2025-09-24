#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'

# Informações
sleep 1
echo -e "${GREEN}Script de instalação do Arch Linux\n${NC}"
sleep 1

echo -e "Configuração das partições:"
sleep 0.1
echo -e "| /dev/sda1 | 1G   | EFI  | /boot/efi |"
sleep 0.1
echo -e "| /dev/sda2 | 4G   | swap |           |"
sleep 0.1
echo -e "| /dev/sda3 | 100% | ext4 | /         |"
sleep 0.1

# Tabela de partição GPT
parted -s /dev/sda mklabel gpt

# Partição do para o boot
parted -s /dev/sda mkpart primary fat32 1MiB 1025MiB
parted -s /dev/sda set 1 esp on

# Partição para o swap
parted -s /dev/sda mkpart primary linux-swap 1025MiB 5GiB

# Partição para o sistema
parted -s /dev/sda mkpart primary ext4 5GiB 100%

sleep 1

# Formatação
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

sleep 1

# Monta as partições
mount /dev/sda3 /mnt

mount --mkdir /dev/sda1 /mnt/boot/efi

swapon /dev/sda2

sleep 1

# Instalação do sistema base
pacstrap -K /mnt base linux linux-firmware

sleep 1

# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

sleep 1

echo "Instalação base finalizada"



















