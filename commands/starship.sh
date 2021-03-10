#!/bin/zsh

install_starship() {
    if ! [ $+commands[zsh] ]; then
        echo "Zsh must be installed"
        exit 1
    fi

    echo Installing starship dependencies
    echo Installed starship dependencies

    echo Installing starship
    echo Installed starship
}