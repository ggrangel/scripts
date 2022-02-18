#!/usr/bin/bash

# For GTK theming: https://github.com/antoniosarosi/dotfiles/blob/master/README.md#gtk-theming

# ========== ========== ========== ========== global variables

PACMAN_PACKAGES=(
	awesome
	base-devel
	cmatrix
	# codespell
	dmenu
	feh
	figlet
	fzf # used by zoxide
	git
	go        # for vim-hexokinase
	highlight # ccat alias
	htop
	kitty
    kvantum-qt5  # apply gtk themes to qt programs
	lxsession # policy kit authentication agent (for apps like gparted and etcher)
	luarocks
	maim
	noto-fonts
	ncdu # sort and list disk usage by size
	neofetch
	neovim
	npm # required by LspInstall
	numlockx
	pass
	pcmanfm # sometimes it is useful
	picom
	prettier
	psutils
	pulsemixer
	pyenv
	python-pip
	ranger
	rofi
	rsync
	shellcheck
	shfmt
	slack-desktop
	slock
	sxhkd
	sxiv
	telegram-desktop
	ttf-dejavu
	ttf-liberation
	tmux
	udisks2
	ueberzug # ranger preview image
	unzip    # for :LspInstall
	xautolock
	xcape   # change keymaps
	xdotool # simulates keyboard input and mouse activity
	xclip
	xorg-server
	xorg-xinit
	xorg-xkill
	xorg-xrandr
	zathura
	zathura-pdf-poppler
	zoxide
	zsh
	zsh-syntax-highlighting
)

AUR_PACKAGES=(
	balena-etcher
	bashmount
	brave-bin
	colorpicker
	devour
	dtrx # extract compressed files
	hollywood
	insync
	nerd-fonts-complete
	nvim-packer-git
	sc-im
	slack-desktop
	stylua
	todotxt
	whatsapp-nativefier
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
	git clone https://github.com/gustavobrangel/scripts.git $HOME/
	git clone https://github.com/gustavobrangel/dotfiles.git $HOME/.config
}

setup_vim() {
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	# nvim --headless +PackerSync +qa
}

upgrade_and_clean_system() {
	sudo pacman -Syu --noconfirm
	sudo pacman -Scc --noconfirm # clean cache
}

change_shell() {
	chsh -s /bin/zsh
}

gtk_theming() {
    sudo cp -a ./theme/Material-Black-Blueberry/ /usr/share/theme/
    sudo cp -a ./icons/Material-Black-Blueberry-Suru/ /usr/share/icon/
}

# ========== ========== ========== ========== functions call

#install_pacman_packages
#install_AUR_packages
#install_pyenv
#install_pip_packages
#setup_git
#setup_repos
# setup_vim
#change_shell
gtk_theming
#upgrade_and_clean_system
