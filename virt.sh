#!/bin/bash

virt_support=false

if grep -q 'vmx' /proc/cpuinfo; then
    echo "Intel CPU with VT-x support detected."
    virt_support=true
fi

if grep -q 'svm' /proc/cpuinfo; then
    echo "AMD CPU with AMD-V support detected."
    virt_support=true
fi

if lscpu | grep -q 'Virtualization'; then
    echo "Virtualization support detected via lscpu."
    virt_support=true
fi

if ! $virt_support; then
    echo "No virtualization support detected."
fi