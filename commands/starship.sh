#!/bin/zsh

install_starship() {
    echo Installing starship optional dependencies
    sudo pacman -S --noconfirm noto-fonts-emoji
    paru -S --noconfirm powerline-fonts
    echo Installed starship optional dependencies

    echo Installing starship
    pacman -S --noconfirm starship
    echo Installed starship
}