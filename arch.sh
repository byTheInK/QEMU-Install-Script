#!/bin/bash

echo "Setting up..."
sleep 1
echo "Updating system..."
sudo pacman -Syu --noconfirm

if [ $? -ne 0 ]; then
    echo "System update failed"
    exit 1
fi

sudo pacman -S --needed git base-devel --noconfirm

if [ $? -ne 0 ]; then
    echo "Failed to install required packages (git, base-devel)"
    exit 1
fi

if ! command -v yay &> /dev/null
then
    echo "Yay not found, installing..."
    sleep 1
    sudo git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    if [ $? -ne 0 ]; then
        echo "Failed to install Yay"
        exit 1
    fi
    echo "Installed Yay"
    sleep 1
fi

_done=false

while [[ "$_done" = false ]]; do
    echo "Inside the loop..."
    echo "[1]: qemu-full <- Recommended"
    echo "[2]: qemu-base"
    echo "[3]: qemu-desktop"

    read -p ": " _qemu

    if [ "$_qemu" = "1" ]; then
        echo "Installing qemu-full package from AUR"
        sleep 3

        yay -S qemu-full
        
        if [ $? -ne 0 ]; then
            echo "Failed to install qemu-full"
            exit 1
        fi

        _done=true

    elif [ "$_qemu" = "2" ]; then
        echo "Installing qemu-base package from AUR"
        sleep 3

        yay -S qemu-base

        if [ $? -ne 0 ]; then
            echo "Failed to install qemu-base"
            exit 1
        fi

        _done=true

    elif [ "$_qemu" = "3" ]; then
        echo "Installing qemu-desktop package from AUR"
        sleep 3

        yay -S qemu-desktop

        if [ $? -ne 0 ]; then
            echo "Failed to install qemu-desktop"
            exit 1
        fi

        _done=true
    fi
done

sleep 2
echo "Setup finished"