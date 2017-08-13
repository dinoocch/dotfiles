#!/bin/bash

# Where is this script?
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Script running from: $DIR"

# ZSH
echo "Installing zsh files"
ln -fns "${DIR}/zsh/sources" ~/.zsh
ln -fs "${DIR}/zsh/zshrc" ~/.zshrc
ln -fs "${DIR}/zsh/zprofile" ~/.zprofile

# git
echo "Installing git config"
ln -fs "${DIR}/git/gitconfig" ~/.gitconfig

# emacs
echo "Installing emacs config"
mkdir -p ~/.emacs.d
ln -fs "${DIR}/emacs/init.el" ~/.emacs.d/init.el

# nvim
echo "Installing neovim configuration"
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/autoload
ln -fs "${DIR}/nvim/init.vim" ~/.config/nvim/init.vim
ln -fs "${DIR}/nvim/vim-plug/plug.vim" ~/.config/nvim/autoload/plug.vim
mkdir -p ~/.vim
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo
ln -fns "${DIR}/nvim/templates" ~/.vim/templates

# vim
echo "Installing vim configuration"
mkdir -p ~/.vim/autoload
ln -fs "${DIR}/vim/vimrc" ~/.vimrc
ln -fs "${DIR}/nvim/vim-plug/plug.vim" ~/.vim/autoload/plug.vim

# i3
echo "Installing i3 configuration"
mkdir -p ~/.i3
ln -fs "${DIR}/i3/config" ~/.i3/config

# x11
echo "Installing xresources"
ln -fs "${DIR}/x11/Xresources" ~/.Xresources

# tmux
echo "Installing tmux config"
ln -fs "${DIR}/tmux/tmux.conf" ~/.tmux.conf

# r2
echo "Setting up r2"
ln -fs "${DIR}/r2/radare2rc" ~/.radare2rc

# ctags
echo "Setting up ctags"
ln -fs "${DIR}/ctags/ctags" ~/.ctags
