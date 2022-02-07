#!/usr/bin/bash

################################################################################################################
# Future Gustavo: you will want to read this before making any modification in this script
# https://stackoverflow.com/questions/18135451/what-is-the-difference-between-var-var-and-var-in-the-bash-shell
###############################################################################################################

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
	gnome-clocks
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
	texlive-most
	time
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
	flake8     # general
	bandit     # security flaws
	mypy       # typehints
	pydocstyle # documentation
	# Fixers
	black # general
	isort # imports
)

REMOVE_PACKAGES=(
	arcolinux-alacritty-git
	arcolinux-neofetch-git
	arcolinux-sddm-simplicity-git
	arcolinux-wallpaper-git
	arcolinuxd-welcome-app-git
	nano
)

# ERROR_MESSAGE='\e[1;91m[ERR0R]'
INFO_MESSAGE='\e[1;92m[INFO]'
NO_COLOR='\e[0m'

ECHO=1 # 0: false; 1: true

# ========== ========== ========== ========== auxiliary functions

display_message() {
	type=$1
	message=$2
	((ECHO)) && echo -e "$type $message${NO_COLOR}"
}

# ========== ========== ========== ========== functions definitions

install_pacman_packages() {
	for package in "${PACMAN_PACKAGES[@]}"; do
		if [[ ! -x $(which "$package") ]]; then
			display_message "$INFO_MESSAGE" "INSTALLING PACKAGE ${package^^}..."
			sudo pacman -S "$package" --noconfirm
		else
			display_message "$INFO_MESSAGE" "PACKAGE ${package^^} IS ALREADY INSTALLED."
		fi
	done
}

install_AUR_packages() {
	for package in "${AUR_PACKAGES[@]}"; do
		if [[ ! -x $(which "$package") ]]; then
			display_message "$INFO_MESSAGE" "INSTALLING AUR-PACKAGE ${package^^}..."
			paru -S "$package" --noconfirm
		else
			display_message "$INFO_MESSAGE" "PACKAGE ${package^^} IS ALREADY INSTALLED."
		fi
	done
}

install_pip_packages() {
	for package in "${PIP_PACKAGES[@]}"; do
		display_message "$INFO_MESSAGE" "INSTALLING PIP-PACKAGE ${package^^}..."
		sudo pip install "$package"
	done
}

install_pyenv() {
	display_message "$INFO_MESSAGE" "SETTING UP PYENV..."

	## install pyenv
	curl https://pyenv.run | bash
}

setup_git() {
	git config --global user.email "gustavorangel91@gmail.com"
	git config --global user.name "Gustavo Rangel"
}

remove_pre_installed_packages() {
	display_message "$INFO_MESSAGE" "REMOVING ${#REMOVE_PACKAGES[@]} PRE-INSTALLED PACKAGES..."

	for package in "${REMOVE_PACKAGES[@]}"; do
		display_message "$INFO_MESSAGE" "REMOVING PACKAGE ${package^^}..."
		sudo pacman -Rns "$package" -y
	done
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
# remove_pre_installed_packages
install_pacman_packages
install_AUR_packages
install_pip_packages
install_pyenv
setup_git
change_shell
upgrade_and_clean_system
