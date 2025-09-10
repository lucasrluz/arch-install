#!/bin/bash

# Tabela de partição GPT
parted -s /dev/sda mklabel gpt

# Partição do para o boot
parted -s /dev/sda mkpart primary fat32 1MiB 1025MiB
parted -s /dev/sda set 1 esp on

# Partição para o sistema
parted -s /dev/sda mkpart primary ext4 1025MiB 507844MiB

# Partição para o swap
parted -s /dev/sda mkpart primary linux-swap 507844MiB 100%

sleep 1

# Formatação
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3

# Monta as partições
mount /dev/sda2 /mnt

mkdir -r /mnt/boot/efi

mount /dev/sda1 /mnt/boot/efi

swapon /dev/sda3


















