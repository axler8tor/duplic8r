#!/usr/bin/zsh

NOW=$(date +%y%m%d%H%M%S)

# make backups
backup() {
    FILE=$HOME/.tigrc
    if [[ -f $FILE ]]
    then
        mv $FILE $FILE-$NOW
        echo "Moved $FILE to $FILE-$NOW."
    fi
}

# link files
link() {
    ln -s $(pwd)/tigrc $HOME/.tigrc
    echo "Linked $(pwd)/tigrc to $HOME/.tigrc"
}

main() {
    backup
    link
}

main

