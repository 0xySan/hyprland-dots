#!/bin/bash

check_package() {
    if ! "$1" -Qs "$2" >/dev/null 2>&1; then
        echo "$2 is not installed. Installing $2..."
        if [ "$1" = "yay" ]; then
            "$1" -S --noconfirm --needed "$2"
        else
            sudo "$1" -S --noconfirm --needed "$2"
        fi
    else
        echo "$2 is already installed."
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
check_package "pacman" "hyprland"
check_package "pacman" "waybar"
check_package "pacman" "rofi"
check_package "pacman" "thunar"
check_package "pacman" "kitty"
check_package "pacman" "firefox"
check_package "pacman" "blueman"
check_package "pacman" "pavucontrol"
check_package "pacman" "baobab"

cp config/* ~/.config/hypr/