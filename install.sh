#!/bin/zsh

for command in "$(ls commands)"
do
    echo "Loading commands from commands/$command"
    source "commands/$command"
done

echo
if [ $# -eq 0 ]; then
    echo "No args supplied to script."
    exit 1
elif [[ $# -eq 1 && $1 == all ]]; then
    echo "Un argumento" $1

    install_starship
else 
    echo "Varios argumentos" $@

    install_starship
fi

