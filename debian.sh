#!/bin/bash
set -e

echo "Updating system..."
sudo apt update &> /dev/null
echo "Updated the system"
sleep 1

echo "Installing Qemu, Libvirt, KVM and  Virt-manager"
sudo apt install qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager &> /dev/null
echo "Installed required packages sucsessfully"