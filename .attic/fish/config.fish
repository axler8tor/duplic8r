# BEHAVIOUR
function fish_mode_prompt; end

fish_vi_key_bindings

# GREETING
set fish_greeting ''

# PATHS
## CONSTANTS
set OPT_HOME               /opt
set LOCAL_HOME             $HOME/.local
set CARGO_HOME             $HOME/.cargo
set PROJECTS_HOME          $HOME/Projects
set NODE_MODULES_HOME      $HOME/.node_modules
set GOPATH                 $HOME/.go

# APPLICATION
set SBCL_HOME              $LOCAL_HOME/lib/sbcl

## PREPEND
set --global --export PATH $HOME/.bin       $PATH
set --global --export PATH $LOCAL_HOME/bin  $PATH

## APPEND
set --global --export PATH $PATH            $CARGO_HOME/bin
set --global --export PATH $PATH            $NODE_MODULES_HOME/bin
set --global --export PATH $PATH            $GOPATH/bin

# DEFINES
set --global --export TMP                   /tmp
set --global --export RUST_SRC_PATH         $HOME/.lib/src/rust/src
set --global --export XDG_CONFIG_HOME       $HOME/.config

# APPS
set --global --export BROWSER       google-chrome
set --global --export PAGER         less

# URLS
set --global --export VAULT_ADDR    'http://127.0.0.1:8200'

# SYSTEM
set --global --export TERM    xterm-256color

if status --is-interactive
    # directories
    alias ..        "cd .."
    alias ...       "cd ../.."
    alias ....      "cd ../../.."
    alias .....     "cd ../../../.."
    alias axler8tor "cd $PROJECTS_HOME/axler8tor"
    alias bin       "cd $HOME/.bin"
    alias books     "cd $HOME/Documents/Books"
    alias downloads "cd $HOME/Downloads"
    alias fishcfg   "cd $HOME/.config/fish"
    alias github    "cd $PROJECTS_HOME/GitHub"
    alias lib       "cd $HOME/.lib"
    alias music     "cd $HOME/Music"
    alias opt       "cd $OPT_HOME/axl"
    alias projects  "cd $PROJECTS_HOME"
    alias stdcfg    "cd $HOME/.stdcfg.d"
    alias venv      "cd $HOME/VirtualEnv"
    # applications
    alias ckspell-af "env TERM=screen-256color aspell check -laf "
    alias ckspell-en "env TERM=screen-256color aspell check "
    alias clisp      "clisp -q "
    alias dict-af    "env TERM=screen-256color aspell -a -laf "
    alias dict-en    "env TERM=screen-256color aspell -a "
    alias sbcl       "env SBCL_HOME=$SBCL_HOME sbcl "
    alias spacemacs  "env SHELL=/bin/bash emacs25 --insecure -nw "
    alias tma        "tmux attach-session -t "
    alias tmk        "tmux kill-session -t "
    alias tml        "tmux list-sessions "
    alias tmw        "tmux new-window -n "
    alias tmvim      "env TERM=screen-256color-italic nvim "
    alias top        "env TERM=screen-256color-italic htop"
    # shells
    alias :q exit
    alias cp "command cp -uv "
    alias df "command df -h "
    alias dir "command dir --color=auto "
    alias du "command du -h "
    alias fgrep "command fgrep --color=auto "
    alias grep "command grep --color=auto "
    alias l "l1 "
    alias l1 "ls -1 "
    alias lS "ls -S "
    alias la "ls -A "
    alias ll "ls -l -k -h "
    alias llS "ll -S "
    alias lld "tree -ifd --noreport --dirsfirst "
    alias llf "tree -if --noreport "
    alias ls "command ls --color=auto -F --group-directories-first -X "
    alias lsd "find (pwd) -mindepth 1 -maxdepth 1 -type d | sort "
    alias lsf "find (pwd) -maxdepth 1 -type f | sort "
    alias less "command less -RFX "
    alias mv "command mv -uv "
    alias ngrep "grep -v "
    alias pgrep "command pgrep "
    alias tree "command tree -F "
    # terminals
    alias new-bash-dark-terminal "gnome-terminal --command bash --window-with-profile 'Solarized Dark' --geometry '110x40' "
    alias new-bash-light-terminal "gnome-terminal --command bash --window-with-profile 'Solarized Light' --geometry '110x40' "
    alias new-fish-dark-terminal "gnome-terminal --command fish --window-with-profile 'Solarized Dark' --geometry '110x40' "
    alias new-fish-light-terminal "gnome-terminal --command fish --window-with-profile 'Solarized Light' --geometry '110x40' "
    alias new-zsh-dark-terminal "gnome-terminal --command zsh --window-with-profile 'Solarized Dark' --geometry '110x40' "
    alias new-zsh-light-terminal "gnome-terminal --command zsh --window-with-profile 'Solarized Light' --geometry '110x40' "
    alias new-pwsh-dark-terminal "gnome-terminal --command pwsh --window-with-profile 'Solarized Dark' --geometry '110x40' "
    alias new-pwsh-light-terminal "gnome-terminal --command pwsh --window-with-profile 'Solarized Light' --geometry '110x40' "
    alias bdt new-bash-dark-terminal
    alias blt new-bash-light-terminal
    alias fdt new-fish-dark-terminal
    alias flt new-fish-light-terminal
    alias zdt new-zsh-dark-terminal
    alias zlt new-zsh-light-terminal
    alias pdt new-pwsh-dark-terminal
    alias plt new-pwsh-light-terminal

    # COLORS
    dircolors --c-shell $HOME/.dircolors | source

    # POWERLINE
    # set --global --export POWERLINE "ON"
    #set fish_function_path $fish_function_path "/home/axl/.local/lib/python3.5/site-packages/powerline/bindings/fish"
    #powerline-setup

    # OH MY FISH
    # --theme
    set -g theme_display_date no
    set theme_color_scheme solarized
end

# OPAM configuration
source /home/axl/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
