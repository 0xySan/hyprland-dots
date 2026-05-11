#!/bin/bash

check_package() {
    if ! pacman -Qs "$1" >/dev/null 2>&1; then
        echo "$1 is not installed. Installing $1..."
        sudo pacman -S --noconfirm "$1"
    else
        echo "$1 is already installed."
    fi
}

install_yay() {
    if ! command -v yay >/dev/null 2>&1; then
        echo "yay is not installed. Installing yay..."
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    else
        echo "yay is already installed."
    fi
}

install_yay
check_package "hyprland"
check_package "waybar"
check_package "rofi"
check_package "thunar"
check_package "kitty"
check_package "firefox"
check_package "blueman"