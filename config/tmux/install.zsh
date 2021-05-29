#!/usr/bin/zsh

NOW=$(date +%y%m%d%H%M%S)

# make backups
backup() {
    FILE=$HOME/.tmux.conf
    if [[ -f $FILE ]]
    then
        mv $FILE $FILE-$NOW
        echo "Moved $FILE to $FILE-$NOW."
    fi
}

# link files
link() {
    ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
    echo "Linked $(pwd)/tmux.conf to $HOME/.tmux.conf"
}

main() {
    backup
    link
}

main

