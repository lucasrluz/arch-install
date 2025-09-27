#!/bin/bash
set -euo pipefail

# Cores
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
RESET="\e[0m"

# Configuração básica
DISK="/dev/sda"
HOSTNAME="archlinux"
USERNAME="lucas"
TIMEZONE="America/Sao_Paulo"
LOCALE="pt_BR.UTF-8"
KEYMAP="br-abnt2"

# Informações
sleep 1
echo -e "${GREEN}Script de instalação do Arch Linux${RESET}"
sleep 1

echo -e "\n${BLUE}[CONFIGURAÇÃO BÁSICA]${RESET}"
sleep 1
echo "DISK      = $DISK"
sleep 0.1
echo "HOSTNAME  = $HOSTNAME"
sleep 0.1
echo "USERNAME  = $USERNAME"
sleep 0.1
echo "TIMEZONE  = $TIMEZONE"
sleep 0.1
echo "LOCALE    = $LOCALE"
sleep 0.1
echo "KEYMAP    = $KEYMAP"
sleep 0.1

# Configuração das partições
echo -e "\n${BLUE}[CONFIGURAÇÃO DAS PARTIÇÕES]${RESET}"
sleep 0.1
echo -e "| /dev/sda1 | 1G   | EFI  | /boot/efi |"
sleep 0.1
echo -e "| /dev/sda2 | 4G   | swap |           |"
sleep 0.1
echo -e "| /dev/sda3 | 100% | ext4 | /         |\n"
sleep 0.1

read -p "Continuar com a instalação? [y/n] " CONF
if [[ "$CONF" != "y" ]]; then
    echo -e "${RED}Instalação abortada${RESET}"
    exit 1
fi

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



















