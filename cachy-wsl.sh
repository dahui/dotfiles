#!/bin/bash

pacman -Sy --noconfirm sudo curl wget

curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo\
sudo ./cachyos-repo.sh

pacman -Sy --noconfirm cachyos-hooks \
      cachyos-keyring \
      cachyos-mirrorlist \
      cachyos-v3-mirrorlist \
      cachyos-v4-mirrorlist
      cachyos-rate-mirrors \
      chwd \
      cachyos-hello \
      cachyos-kernel-manager \
      cachyos-packageinstaller \
      cachyos-settings \
      cachyos-micro-settings \
      cachyos-fish-config \
      cachyos-zsh-config \
      dhclient \
      dnsmasq \
      dnsutils \
      ethtool \
      pacman-contrib \
      pkgfile \
      rebuild-detector \
      reflector \
      paru \
      octopi \
      accountsservice \
      bash-completion \
      mlocate \
      xdg-user-dirs \
      xdg-utils \
      haveged \
      nfs-utils \
      nilfs-utils \
      ntp \
      smartmontools \
      unrar \
      unzip \
      xz \
      awesome-terminal-fonts \
      noto-fonts-emoji \
      noto-color-emoji-fontconfig \
      cantarell-fonts \
      freetype2 \
      noto-fonts \
      ttf-bitstream-vera \
      ttf-dejavu \
      ttf-liberation \
      ttf-opensans \
      ttf-meslo-nerd \
      noto-fonts-cjk \
      btop \
      duf \
      findutils \
      fsarchiver \
      git \
      glances \
      hwinfo \
      inxi \
      meld \
      nano-syntax-highlighting \
      fastfetch \
      pv \
      python-defusedxml \
      python-packaging \
      rsync \
      sed \
      vi \
      wget \
      ripgrep \
      micro \
      nano \
      vim \
      amd-ucode \
      intel-ucode \

