function tms --argument-names name_ --description 'New tmux session.'
    env TERM=screen-256color-italic tmux new-session -s $name_ -n $name_
end
