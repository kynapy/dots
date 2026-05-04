#!/bin/bash

# Package installation
pacman -Syu
# TODO: Double check the packages
pacman -S git wget neovim kitty postgresql docker make cmake curl unzip \
    hyprland hyprpaper hyprshot hyprlock rofi swaync waybar \
    pipewire pipewire-alsa pipewire-pulse wireplumber \
    wl-clipboard thunar bluetui impala obs-studio obsidian imv darktable \
    chromium telegram-desktop pavucontrol ttf-jetbrains-mono ollama \
    stow

# Installation of yay (AUR helper) # TODO: Possible to migrate to paru
pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

yay -S dropbox betterbird-bin zen-browser-bin notion-app-electron \
    localsend wlogout

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
nvm install --lts

# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Set up dotfiles
stow nvim
stow hypr
stow waybar
stow kitty

# TODO: Manual Installations
# 1. Steam
# 2. GPU drivers
# 3. Linux Kernel
# 4. OpenCL drivers
