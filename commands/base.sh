#!/bin/zsh

install_base_packages() {
    echoerr Need to actualize pacman database
    sudo pacman -Syyu --noconfirm  

    echoerr Install recent zsh and completions
    sudo pacman -Sq --noconfirm zsh
    sudo pacman -Sq --noconfirm zsh-completions

    echoerr Install exa to use it as an alias of ls
    sudo pacman -Sq --noconfirm exa

    echoerr Install alacritty to use it as main terminal
    sudo pacman -Sq --noconfirm alacritty
}