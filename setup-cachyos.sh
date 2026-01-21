#!/bin/bash

echo "Installing packages..."
paru -Sy --repo --skipreview stow hhd hhd-ui acpi_call \
    vivaldi ghostty linux-bazzite-bin cachyos-gaming-meta \
    vscode bazaar protonup-qt protonplus sbctl ryzenadj dkms \
    nerd-fonts wireguard-tools minio-client iio-sensor-proxy

echo "configuring secure boot..."
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo sbctl-batch-sign

echo "Setting up dkms for secure boot..."
sudo cp cachy-configs/etc/dkms/* /etc/dkms/

echo "Installing dkms kernel modules..."
paru -Sy --repo --skipreview xone-dkms ryzen_smu-dkms-git

echo "Setting up module configs..."
sudo cp -a cachy-configs/etc/modprobe.d/* /etc/modprobe.d
sudo chown root:root /etc/modprobe.d/*
echo "done!"

echo "Enabling auto-rotation..."
sudo systemctl enable --now iio-sensor-proxy
echo "done!"
