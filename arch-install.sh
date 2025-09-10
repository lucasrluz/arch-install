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
