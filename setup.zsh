#!/bin/zsh

set -e
set -u

# Where is this script?
DIR="$(pwd)"
echo "Script running from: $DIR"

BREW="${BREW:-false}"
BREW_URL="https://raw.githubusercontent.com/Homebrew/install/master/install"
BREW_TAPS=('crisidev/homebrew-chunkwm')
BREW_CASKS=('visual-studio-code')
BREW_INSTALLS=('neovim' 'python' 'chunkwm' 'koekeishiya/formulae/skhd')

function config_zsh() {
	echo "Installing zsh files"
	ln -fns "${DIR}/zsh/sources" ~/.zsh
	ln -fs "${DIR}/zsh/zshrc" ~/.zshrc
	ln -fs "${DIR}/zsh/zprofile" ~/.zprofile
}

function config_git() {
	echo "Installing git config"
	ln -fs "${DIR}/git/gitconfig" ~/.gitconfig
}

function config_emacs() {
	echo "Installing emacs config"
	mkdir -p ~/.emacs.d
	ln -fs "${DIR}/emacs/init.el" ~/.emacs.d/init.el
}

function config_nvim() {
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
}

function config_vim() {
	echo "Installing vim configuration"
	mkdir -p ~/.vim/autoload
	ln -fs "${DIR}/vim/vimrc" ~/.vimrc
	ln -fs "${DIR}/nvim/vim-plug/plug.vim" ~/.vim/autoload/plug.vim
}

function config_i3() {
	echo "Installing i3 configuration"
	mkdir -p ~/.i3
	ln -fs "${DIR}/i3/config" ~/.i3/config
	ln -fs "${DIR}/i3/config" ~/.i3/status.toml
}

function config_x11() {
	echo "Installing xresources"
	ln -fs "${DIR}/x11/Xresources" ~/.Xresources
}

function config_tmux() {
	echo "Installing tmux config"
	ln -fs "${DIR}/tmux/tmux.conf" ~/.tmux.conf
}

function config_r2() {
	echo "Setting up r2"
	ln -fs "${DIR}/r2/radare2rc" ~/.radare2rc
}

function config_ctags() {
	echo "Setting up ctags"
	ln -fs "${DIR}/ctags/ctags" ~/.ctags
}

function config_ssh() {
	mkdir -p ~/.ssh
	chmod 700 ~/.ssh
	if [ ! -f ~/.ssh/config ]
	then
		ln -fs "${DIR}/ssh/config" ~/.ssh/config
	fi

	if [ ! -f ~/.ssh/id_ed25519 ]
	then
		ssh-keygen -t ed25519
		read -p "Add key to github? [y/N] " -n 1 -r
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			read -s -p "Github Auth Token: " -r github_password
			pub_key=$(cat ~/.ssh/id_ed25519.pub)
			curl -X POST -d "{\"title\": \"$(whoami)@$(hostname)\", \"key\": \"${pub_key}\"}"\
				-H "Authorization: token ${github_password}" \
				https://api.github.com/user/keys
		fi
	fi
}

function config_brew() {
	if (( ! $+commands[brew] )) {
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
	}
}

function config_alacritty() {
	echo "Installing alacritty config"
	mkdir -p ~/.config/alacritty
	ln -fs "${DIR}/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
}

function config_chunkwm() {
	echo "Configuring chunkwm"
	ln -fs "${DIR}/chunkwm/chunkwmrc" ~/.chunkwmrc
	ln -fs "${DIR}/chunkwm/skhdrc" ~/.skhdrc

}

function main() {
	if (( $BREW )) {
		config_brew
	}

	if (( $+commands[git] )) {
		config_git
	}

	if (( $+commands[nvim] )) {
		config_nvim
	}

	if (( $+commands[vim] )) {
		config_vim
	}

	if (( $+commands[emacs] )) {
		config_emacs
	}

	if (( $+commands[alacritty] )) {
		config_alacritty
	}

	if (( $+commands[tmux] )) {
		config_tmux
	}

	if (( $+commands[ctags] )) {
		config_ctags
	}

	if (( $+commands[r2] )) {
		config_r2
	}

	if (( $+commands[startx] )) {
		config_x11
	}

	if (( $+commands[chunkwm] )) {
		config_chunkwm
	}

	if [[ ! -d ~/.ssh ]]; then
		config_ssh
	fi

}

main
