set -e


create_symlink() {
  ln --symbolic $1 $2
}


install_system_requirements() {
    local FLAGS=(
        --no-install-recommends
        --no-show-upgraded
        --quiet
        --yes
    )
    local APT_PACKAGES=(
        devilspie2
        git
        git-flow
        tig
        htop
        less
        lsof
        python3
        python3-pip
        strace
        taskwarrior
        tmux
        tmux-plugin-manager
        tree
        unzip
        zip
        zsh
        zsh-autosuggestions
        zsh-doc
        zsh-syntax-highlighting
    )
    apt update && apt upgrade ${FLAGS[@]}
    apt install ${FLAGS[@]} ${APT_PACKAGES[@]}
}


install_python_requirements() {
    pip3 install --upgrade pip
    for package in powerline-status powerline-gitstatus; do
        pip3 install --user $package
    done
}


backup_existing_config() {
    local TIMESTAMP=$(date +%Y%m%d%H%M%S)
    local FILES=(
        $HOME/.XCompose
        $HOME/.ctags
        $HOME/.dircolors
        $HOME/.gitcommit
        $HOME/.gitconfig
        $HOME/.gitignore
        $HOME/.taskrc
        $HOME/.tigrc
        $HOME/.tmux.conf
        $HOME/.tmux_extend.zsh
        $HOME/.zshalias
        $HOME/.zshenv
        $HOME/.zshfunction
        $HOME/.zshprompt
        $HOME/.zshrc
    )
    for file in ${FILES[@]}; do
        if [ -f $file ]; then
            mv $file $file.$TIMESTAMP
        fi
    done

    local DIRECTORIES=(
        $HOME/.config/bat
        $HOME/.config/devilspie2
        $HOME/.config/julia
        $HOME/.config/kitty
        $HOME/.config/nvim
        $HOME/.config/powerline
        $HOME/.config/powershell
        $HOME/.config/taskwarrior
    )
    for dir in ${DIRECTORIES[@]}; do
        if [ -d $dir ]; then
            mv $dir $dir.$TIMESTAMP
        fi
    done
}

install_duplic8r() {
    local DUPLIC8R_HOME="$HOME/.duplic8r"
    local DUPLIC8R_SOURCE="$DUPLIC8R_HOME/homedir"
    local DUPLIC8R_TARGET="$HOME/.config"

    git clone https://github.com/axler8r/duplic8r.git $DUPLIC8R_HOME

    if [ ! -d $DUPLIC8R_TARGET ]; then
        mkdir --parents $DUPLIC8R_TARGET
    fi

    ln --symbolic $DUPLIC8R_SOURCE/XCompose $HOME/.XCompose
    ln --symbolic $DUPLIC8R_SOURCE/ctags $HOME/.ctags
    ln --symbolic $DUPLIC8R_SOURCE/dircolors $HOME/.dircolors
    ln --symbolic $DUPLIC8R_SOURCE/gitcommit $HOME/.gitcommit
    ln --symbolic $DUPLIC8R_SOURCE/gitconfig $HOME/.gitconfig
    ln --symbolic $DUPLIC8R_SOURCE/gitignore $HOME/.gitignore
    ln --symbolic $DUPLIC8R_SOURCE/taskrc $HOME/.taskrc
    ln --symbolic $DUPLIC8R_SOURCE/tigrc $HOME/.tigrc
    ln --symbolic $DUPLIC8R_SOURCE/tmux $HOME/.tmux.conf
    ln --symbolic $DUPLIC8R_SOURCE/tmux_extend.zsh $HOME/.tmux_extend.zsh
    ln --symbolic $DUPLIC8R_SOURCE/zshalias $HOME/.zshalias
    ln --symbolic $DUPLIC8R_SOURCE/zshenv $HOME/.zshenv
    ln --symbolic $DUPLIC8R_SOURCE/zshfunction $HOME/.zshfunction
    ln --symbolic $DUPLIC8R_SOURCE/zshprompt $HOME/.zshprompt
    ln --symbolic $DUPLIC8R_SOURCE/zshrc $HOME/.zshrc

    ln --symbolic $DUPLIC8R_SOURCE/config/bat $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/devilspie2 $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/julia $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/kitty $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/nvim $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/powerline $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/powershell $DUPLIC8R_TARGET
    ln --symbolic $DUPLIC8R_SOURCE/config/taskwarrior $DUPLIC8R_TARGET
}


configure_tmux_plugin_manager() {
    if [ ! -d $HOME/.tmux ]; then
        mkdir --parents $HOME/.tmux/plugins
    fi
    ln --symbolic /usr/share/tmux-plugin-manager $HOME/.tmux/plugins/tpm
}


install_vim_plug() {
    local FLAGS=(
        --create-dirs
        --fail
        --location
        --output
    )
    curl ${FLAGS[@]} "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


install_asdf() {
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.13.1
    . $HOME/.asdf/asdf.sh

    local ASDF_PLUGINS=(
        bat
        choose
        dive
        duf
        exa
        fd
        fzf
        github-cli
        jq
        just
        neovim
        ripgrep
        tokei
        yq
    )
    for plugin in ${ASDF_PLUGINS[@]}; do
        echo "Installing $plugin"
        asdf plugin add $plugin
        asdf install $plugin latest
        asdf global $plugin $(asdf latest $plugin)
    done
}


set_default_shell() {
    chsh --shell $(which zsh) ${USER}
}


install() {
    if [ $(id --user) -eq 0 ]; then
        install_system_requirements
    else
        sudo install_system_requirements
    fi
    install_python_requirements
    backup_existing_config
    install_duplic8r
    configure_tmux_plugin_manager
    install_vim_plug
    install_asdf
    set_default_shell
}


install


unset DUPLIC8R_PATH
unset DUPLIC8R_TARGET
