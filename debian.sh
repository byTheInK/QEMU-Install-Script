#!/bin/bash
set -e

echo "Updating system..."
sudo apt update &> /dev/null
echo "System updated."
sleep 1

echo "Installing Qemu, Libvirt, KVM, and Virt-manager..."
sudo apt install -y qemu-system-x86 libvirt-daemon-system libvirt-clients bridge-utils virt-manager &> /dev/null
echo "Required packages installed successfully."
