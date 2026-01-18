#!/bin/bash

#
# This script converts a basic ArchLinux WSL install into CachyOS.
#

#
# Get some basic tools that are missing.
#
pacman -Sy --noconfirm sudo curl wget which base-devel openssh git glibc-locales

# Install the CachyOS repositories.
#
cd /tmp
curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
tar xvf cachyos-repo.tar.xz && cd cachyos-repo
sudo ./cachyos-repo.sh

# cachyos-rate-mirrors doesn't get installed with the above scripts for whatever reason,
# so install and run it.
#
sudo pacman -Sy --noconfirm cachyos-rate-mirrors
sudo cachyos-rate-mirrors

# Install core CachyOS packages, as described in their official
# installer configs, minus an X environment and other unneeded
# tools for WSL such as bluetooth control, wireless card tools, 
# kernels, etc. 
#
sudo pacman -Sy --noconfirm cachyos-hooks \
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
      openssh \
      code


# Yes/No function. We need to move this above and put in logic to create a user, set shell, etc. based on user input.
ask_yes_no() {
    local prompt="${1:-Are you sure?}" # Default prompt if none provided
    local default_yes="${2:-Y}"         # Default answer if none provided (Y/n)
    
    # Loop until valid input is received
    while true; do
        read -p "$prompt [$default_yes/n] " answer
        local input=$(echo "$answer" | tr '[A-Z]' '[a-z]') # Convert to lowercase

        case "$input" in
            y|yes) return 0 ;; # Return 0 for success (yes)
            n|no)  return 1 ;; # Return 1 for failure (no)
            "" )
                # If the default is "Y", treat empty input as "yes"
                if [ "$default_yes" = "Y" ] || [ "$default_yes" = "y" ]; then
                    return 0
                else
                    return 1 # If the default is "n", treat empty input as "no"
                fi
            ;;
            *) echo "Invalid input. Please enter yes or no.";;
        esac
    done
}
