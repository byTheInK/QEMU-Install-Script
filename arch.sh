#!/bin/bash

echo "Setting up..."
sleep 1
sudo pacman -S --needed git base-devel

if ! command -v yay &> /dev/null
then
    echo "Yay not found installing"
    sleep 1
    sudo git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    echo "Installed Yay"
    sleep 1
fi

_done=false

while [$_done]; do
    echo "[1]: qemu-full <- Recommended "
    echo "[2]: qemu-base"
    echo "[3]: qemu-desktop"

    echo -n ": " 
    read _qemu

    if [$_qemu = "1"]; then
        echo "Installing qemu-full package from AUR"
        sleep 3

        yay -S qemu-full 
    fi

    if [$_qemu = "2"]; then
        echo "Installing qemu-base package from AUR"
        sleep 3

        yay -S qemu-base
    fi

    if [$_qemu = "1"]; then
        echo "Installing qemu-desktop package from AUR"
        sleep 3

        yay -S qemu-desktop
    fi
done