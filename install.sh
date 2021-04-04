#!/bin/zsh

echoerr() { echo "$@" 1>&2; }

if [ $# -eq 0 ]; then
    echoerr "No args supplied to script."
    exit 1
fi

for command in $(ls -1 commands)
do
    echoerr "Loading commands from ./commands/$command"
    source "./commands/$command"
done

install_base_packages

echo
if [[ $# -eq 1 && $1 == all ]]; then
    echo "Un argumento" $1

    install_starship
else 
    echo "Varios argumentos" $@

    install_starship
fi

