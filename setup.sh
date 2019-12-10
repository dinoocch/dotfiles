#!/bin/bash

set -e
set -u

# Where is this script?
DIR=$(cd "$(dirname "$0")"; pwd)
echo "Script exists in: $DIR"

function exists() {
    local command=${1:-echo}
    type $command > /dev/null 2>&1
}

function init() {
    echo "Initializing env variables"
    . "${DIR}/env/Default.env"
    [[  -f "${DIR}/env/$(uname).env" ]] && . "${DIR}/env/$(uname).env"
    [[  -f "${DIR}/env/$(hostname).env" ]] && . "${DIR}/env/$(hostname).env"
    [[  -f "${DIR}/env/$(hostname -f).env" ]] && . "${DIR}/env/$(hostname -f).env"

    echo "Configuring Mustache"
    . "${DIR}/lib/mo"
    echo "Done init"
}

function configure() {
    local from="$1"
    local to="${2:-$(dirname "~/.$(basename "$from")")}"

    local tempfile="$(mktemp)"
    mo $from > tempfile
    if mo $from > tempfile; then
        mkdir -p "$(dirname "$to")"
        mv tempfile $to
    else
        echo "Templating failed for $from , tempfile: $tempfile"
    fi
}

function config_zsh() {
    echo "Installing zsh files"
    ln -fns "${DIR}/zsh/sources" ~/.zsh
    configure "${DIR}/zsh/zshrc" ~/.zshrc
    configure "${DIR}/zsh/zprofile" ~/.zprofile
}

function config_git() {
    echo "Installing git config"
    configure "${DIR}/git/gitconfig" ~/.gitconfig
}

function config_emacs() {
    echo "Installing emacs config"
    configure "${DIR}/emacs/init.el" ~/.emacs.d/init.el
    ln -fns "${DIR}/emacs/sources" ~/.emacs_sources
}

function config_nvim() {
    echo "Installing neovim configuration"
    mkdir -p ~/.config/nvim/autoload
    configure "${DIR}/nvim/init.vim" ~/.config/nvim/init.vim
    configure "${DIR}/nvim/coc-settings.json" ~/.config/nvim/coc-settings.json
    # Keep this as a symlink for easier updating
    ln -fs "${DIR}/nvim/vim-plug/plug.vim" ~/.config/nvim/autoload/plug.vim
    mkdir -p ~/.vim/backups
    mkdir -p ~/.vim/swaps
    mkdir -p ~/.vim/undo
    mkdir -p ~/.vim/skeletons

    [[ -L ~/.vim/skeletons ]] && rm ~/.vim/skeletons
    for template in ${DIR}/nvim/skeletons/*; do
        configure "$template" "$HOME/.vim/skeletons/$(basename $template)"
    done
}

function config_vim() {
    echo "Installing vim configuration"
    configure "${DIR}/vim/vimrc" ~/.vimrc
    mkdir -p ~/.vim/backups
    mkdir -p ~/.vim/swaps
    mkdir -p ~/.vim/undo
}

function config_i3() {
    echo "Installing i3 configuration"
    mkdir -p ~/.i3
    configure "${DIR}/i3/config" ~/.i3/config
    configure "${DIR}/i3/config" ~/.i3/status.toml
}

function config_x11() {
    echo "Installing xresources"
    configure "${DIR}/x11/Xresources" ~/.Xresources
    configure "${DIR}/x11/Xmodmap" ~/.Xmodmap
}

function config_tmux() {
    echo "Installing tmux config"
    configure "${DIR}/tmux/tmux.conf" ~/.tmux.conf

    # xpanes is awesome
    mkdir -p ~/bin
    if [ "${XPANES:-false}" = true ] && [ ! -f ~/bin/xpanes ]; then
        wget https://raw.githubusercontent.com/greymd/tmux-xpanes/master/bin/xpanes -O ~/bin/xpanes
        chmod 755 ~/bin/xpanes
    fi
}

function config_r2() {
    echo "Setting up r2"
    configure "${DIR}/r2/radare2rc" ~/.radare2rc
}

function config_ctags() {
    echo "Setting up ctags"
    configure "${DIR}/ctags/ctags" ~/.ctags
}

function config_ssh() {
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    if [ ! -f ~/.ssh/config ]
    then
        configure "${DIR}/ssh/config" ~/.ssh/config
        chmod 600 ~/.ssh/config
    fi

    if [ ! -f ~/.ssh/id_ed25519 ] && [ "${GENERATE_KEYS:-false}" = true ]
    then
        ssh-keygen -t ed25519
    fi
}

function config_editor_python_venv() {
    if [ ! -d ~/.editor-venv ]; then
        python3 -m venv ~/.editor-venv
        ~/.editor-venv/bin/pip install neovim
    fi
}

function config_brew() {
    if ! exists brew; then
        echo "Did not find brew -- installing and configuring"
        /usr/bin/ruby -e "$(curl -fsSL $BREW_URL)"

        for tap in $BREW_TAPS; do
            brew tap "$tap"
        done

        for cask in $BREW_CASKS; do
            brew cask install "$cask"
        done

        for prog in $BREW_INSTALLS; do
            brew install "$prog"
        done
    fi
}

function config_alacritty() {
    echo "Installing alacritty config"
    mkdir -p ~/.config/alacritty
    configure "${DIR}/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
}

function config_chunkwm() {
    echo "Configuring chunkwm"
    configure "${DIR}/chunkwm/chunkwmrc" ~/.chunkwmrc

}

function config_bspwm() {
    echo "Configuring bspwm"
    mkdir -p ~/.config/bspwm
    configure "${DIR}/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/bspwm/bspwmrc
}

function config_sxhkd() {
    echo "Installing sxhkd config"
    mkdir -p ~/.config/sxhkd
    configure "${DIR}/sxhkd/sxhkdrc" ~/.config/sxhkd/sxhkdrc
}

function config_polybar() {
    echo "Installing polybar config"
    mkdir -p ~/.config/polybar
    configure "${DIR}/polybar/config" ~/.config/polybar/config
}

function install_rust() {
    if ! exists rustup; then
        echo "Installing rustup"
        curl https://sh.rustup.rs -sSf | sh
    else
        echo "rustup found, skiping rust install"
    fi
}

function main() {
    init
    if [ "${BREW:-false}" = true ]; then
        config_brew
    fi

    if exists zsh; then
        config_zsh
    fi

    if exists git; then
        config_git
    fi

    if exists nvim; then
        config_nvim
        if exists python3; then
            config_editor_python_venv
        fi
    fi

    if exists vim; then
        config_vim
    fi

    if exists emacs; then
        config_emacs
    fi

    if [ "${RUST:-false}" = true ]; then
        install_rust
    fi

    if exists alacritty; then
        config_alacritty
    fi

    if exists tmux; then
        config_tmux
    fi

    if exists ctags; then
        config_ctags
    fi

    if exists r2; then
        config_r2
    fi

    if exists i3; then
        config_i3
    fi

    if exists startx; then
        config_x11
    fi

    if exists chunkwm; then
        config_chunkwm
    fi

    if exists bspwm; then
        config_bspwm
    fi

    if exists sxhkd; then
        config_sxhkd
    fi

    if exists polybar; then
        config_polybar
    fi

    config_ssh

}

main
