#!/bin/bash

echo "Installing packages..."
paru -Sy --noconfirm stow z13ctl-bin z13gui-bin \
    vivaldi ghostty cachyos-gaming-meta iio-sensor-proxy rofi \
    vscode bazaar protonplus sbctl ryzenadj dkms \
    nerd-fonts wireguard-tools minio-client 

echo "configuring secure boot..."
sudo sbctl create-keys
sudo sbctl enroll-keys --microsoft
sudo sbctl-batch-sign

echo "Setting up dkms for secure boot..."
sudo cp cachy-configs/etc/dkms/* /etc/dkms/

echo "Installing dkms kernel modules..."
paru -Sy --noconfirm xone-dkms ryzen_smu-dkms-git

echo "Setting up module configs..."
sudo cp -a cachy-configs/etc/modprobe.d/* /etc/modprobe.d
sudo chown root:root /etc/modprobe.d/*
echo "done!"

