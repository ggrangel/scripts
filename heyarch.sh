#!/usr/bin/bash

# ========== ========== ========== ========== global variables

PACMAN_PACKAGES=(
	base-devel
	brave-bin
	cmatrix
	# codespell
	dmenu
	etcher-bin
	feh # set wallpaper
	figlet
	fzf # used by zoxide
	git
	gparted
	highlight # ccat alias
	htop
	insync
	kitty
	lxsession
	ncdu # sort and list disk usage by size
	neofetch
	neovim
	npm # required by LspInstall
	numlockx
	pass
	picom
	psutils
	pulsemixer
	pyenv
	python-pip
	qtile
	ranger
	rofi
	scrot
	shellcheck
	shfmt
	slack-desktop
	slock
	sxhkd
	sxiv
	telegram-desktop
	# texlive-most
	# time
	tmux
	udisks2
	ueberzug # ranger preview image
	unzip    # for :LspInstall
	whatsapp-nativefier
	xautolock
	xcape # change keymaps
	xclip
	zathura
	zathura-pdf-poppler # pdf support to zathura
	zoxide
	zsh
	zsh-syntax-highlighting
)

AUR_PACKAGES=(
	bashmount
	colorpicker
	devour # window swallower
	dtrx   # extract compressed files
	hollywood
	nvim-packer-git
	sc-im
	stylua
	todotxt
)

PIP_PACKAGES=(
	# Linters
	# flake8     # general
	# bandit     # security flaws
	# mypy       # typehints
	# pydocstyle # documentation
	# Fixers
	black # general
	isort # imports
)

# ========== ========== ========== ========== function definition

install_pacman_packages() {
	for package in "${PACMAN_PACKAGES[@]}"; do
		sudo pacman -S "$package" --noconfirm
	done
}

install_AUR_packages() {
	for package in "${AUR_PACKAGES[@]}"; do
		paru -S "$package" --noconfirm
	done
}

install_pyenv() {
	display_message "$INFO_MESSAGE" "SETTING UP PYENV..."

	## install pyenv
	curl https://pyenv.run | bash

}

install_pip_packages() {
	venv=core
	pyenv virtualenv $venv
	venvPath=$HOME/.pyenv/versions/$venv/bin/python
	$venvPath -m pip install --upgrade pip

	for package in "${PIP_PACKAGES[@]}"; do
		$venvPath -m pip install "$package"
	done
}

setup_git() {
	git config --global user.email "gustavorangel91@gmail.com"
	git config --global user.name "Gustavo Rangel"
}

setup_repos() {
    dotfilesTmpPath=$HOME/tmp/dotfiles

    gh auth login
    gh repo clone scripts "$HOME/scripts"

    # TODO test this
    gh repo clone dotfiles "$dotfilesTmpPath" 
    cp "$dotfilesTmpPath/*" "$HOME/.config/"
    rm -rf "$dotfilesTmpPath"
}

upgrade_and_clean_system() {
	display_message "$INFO_MESSAGE" "UPGRADING AND CLEANING SYSTEM..."

	# update and upgrade
	sudo pacman -Syu --noconfirm
	## clean cache
	sudo pacman -Scc --noconfirm
}

change_shell() {
	chsh -s /bin/zsh
}

# ========== ========== ========== ========== functions calls

upgrade_and_clean_system
install_pacman_packages
install_AUR_packages
install_pyenv
install_pip_packages
setup_git
setup_repos
change_shell
upgrade_and_clean_system
