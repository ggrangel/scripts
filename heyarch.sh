#!/usr/bin/bash

# ========== ========== ========== ========== global variables

PACMAN_PACKAGES=(
	base-devel
	brave-bin
	cmatrix
	# codespell
	dmenu
	etcher-bin
	feh 
	figlet
	fzf # used by zoxide
	git
    go  # for vim-hexokinase
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
    pcmanfm  # sometimes it is useful 
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
	zathura-pdf-poppler 
	zoxide
	zsh
	zsh-syntax-highlighting
)

AUR_PACKAGES=(
	bashmount
	colorpicker
	devour 
	dtrx   # extract compressed files
	hollywood
	nvim-packer-git
	sc-im
	stylua
	todotxt
)

PIP_PACKAGES=(
	## Linters
	# flake8     # general
	# bandit     # security flaws
	# mypy       # typehints
	# pydocstyle # documentation
	## Fixers
	black # general
	isort # imports
)

# ========== ========== ========== ========== functions definition

install_pacman_packages() {
	for package in "${PACMAN_PACKAGES[@]}"; do
		sudo pacman -S "$package" --noconfirm
	done
}

install_paru() {
    git clone https://aur.archlinux.org/paru.git $HOME/apps/paru
    cd $HOME/apps/paru
    makepkg -si
}

install_AUR_packages() {
    # install_paru 

	for package in "${AUR_PACKAGES[@]}"; do
		paru -S "$package" --noconfirm
	done
}

install_pyenv() {
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
    git config advice.addIgnoredFile false
}

setup_repos() {
    gh auth login
    gh repo clone scripts "$HOME/scripts"

    # TODO test this
    dotfilesTmpPath=$HOME/tmp/dotfiles
    gh repo clone dotfiles "$dotfilesTmpPath" 
    cp "$dotfilesTmpPath/*" "$HOME/.config/"
    rm -rf "$dotfilesTmpPath"
}

setup_vim() {
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    nvim --headless +PackerSync +qa
}

upgrade_and_clean_system() {
	sudo pacman -Syu --noconfirm
	
	sudo pacman -Scc --noconfirm  # clean cache
}

change_shell() {
	chsh -s /bin/zsh
}

# ========== ========== ========== ========== functions call

upgrade_and_clean_system
install_pacman_packages
install_AUR_packages
install_pyenv
install_pip_packages
setup_git
setup_repos
setup_vim
change_shell
upgrade_and_clean_system
