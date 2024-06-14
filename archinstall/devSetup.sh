#!/usr/bin/bash

setup_general_env() {
	pacmanPacks=(
		aws-cli
		cargo # requiredy by mason.nvim
		github-cli
		go
		luarocks # required by mason.nvim
		npm      # required by some mason.nvim
		python-pip
		ruby # required to install tmuxinator
		tmux
		wget # required by mason.nvim
	)
	install_pacman_packages "${pacmanPacks[@]}"
}

setup_python_env() {
	pacmanPacks=(
		pyenv
	)

	install_pacman_packages "${pacmanPacks[@]}"
	# for auto activation of virtual environments
	pyenv_plugins_folder="$HOME/.local/share/pyenv/plugins"
	mkdir -p "$pyenv_plugins_folder"
	git clone https://github.com/pyenv/pyenv-virtualenv.git "$pyenv_plugins_folder"/pyenv-virtualenv
}

install_AUR_packages() {
	for package in $1; do
		paru -S "$package" --noconfirm
	done

}

install_pacman_packages() {
	for package in $1; do
		sudo pacman -S "$package" --noconfirm
	done
}

install_pip_packages() {
	for package in $1; do
		pip install "$package"
	done
}

setup_general_env
# setup_python_env
