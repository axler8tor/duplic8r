#!/usr/bin/zsh

NOW=$(date +%y%m%d%H%M%S)

# make backups
backup() {
    foreach file in $HOME/.git{config,ignore}
    do
        if [[ -f $file ]]
        then
            mv $file $file-$NOW
            echo "Moved $file to $file-$NOW."
        fi
    done
}

# link files
link() {
    for file in git*
    do
        ln -s $(pwd)/$file $HOME/.$file
        echo "Linked $(pwd)/$file to $HOME/.$file"
    done
}

main() {
    backup
    link
}

main
