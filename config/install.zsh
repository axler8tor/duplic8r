#!/usr/bin/env zsh

_NOW=$(date +%y%m%d%H%M%S)

# make backups
backup() {
    foreach _FILE in $(command ls *(.))
    do
        if [[ -f ${HOME}/.${_FILE} ]]
        then
            mv ${HOME}/.${_FILE} ${HOME}/.${_FILE}-${_NOW}
            echo "Moved ${HOME}/.${_FILE} to ${HOME}/.${_FILE}-${_NOW}"
        fi
    done
}

# link files
link() {
    foreach _FILE in $(command ls *(.))
    do
        ln -s $(pwd)/${_FILE} ${HOME}/.${_FILE}
        echo "Linked $(pwd)/${_FILE} to ${HOME}/.${_FILE}"
    done
}

main() {
    backup
    link
}

main
