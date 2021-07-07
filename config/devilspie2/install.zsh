#!/usr/bin/env zsh

_NOW=$(date +%y%m%d%H%M%S)
if [[ -v XDG_CONFIG_HOME ]]
then
    _CONFIG_HOME="${XDG_CONFIG_HOME}/devilspie2"
else
    _CONFIG_HOME="${HOME}/.config/devilspie2"
fi

# make backups
backup() {
    if [[ -d ${_CONFIG_HOME} ]]
    then
        mv ${_CONFIG_HOME} ${_CONFIG_HOME}-${_NOW}
        echo "Moved ${_CONFIG_HOME} to ${_CONFIG_HOME}-${_NOW}"
    fi
}

# link files
link() {
    ln -s $(pwd) ${_CONFIG_HOME}
    echo "Linked $(pwd) ${_CONFIG_HOME}"
}

main() {
    backup
    link
}

main
