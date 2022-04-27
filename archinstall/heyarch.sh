#!/usr/bin/bash

# This script does the following:
# 1. install pacman, aur and pip packages
# 2. install pyenv
# 3. setup git configuration
# 4. clone github repositories
# 5. install nvim's packer
# 6. change default shell to zsh

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
	github-cli
	go        # for vim-hexokinase
	highlight # ccat alias
	htop
	kitty
	kvantum-qt5 # apply gtk themes to qt programs
	lazygit
	luarocks
	# lxsession   # policy kit authentication agent (for apps like gparted and etcher)
	maim
	ncdu # sort and list disk usage by size
	neofetch
	neovim
	noto-fonts
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
	redshift
	rofi
	rsync
	shellcheck
	shfmt
	slack-desktop
	slock
	stow
	sxhkd
	sxiv # project archived. consider migrating to nsxiv later on
	telegram-desktop
	tmux
	ttf-dejavu
	ttf-liberation
	udisks2
	ueberzug # ranger preview image
	unzip    # for :LspInstall
	xautolock
	xcape # change keymaps
	xclip
	xdotool # simulates keyboard input and mouse activity
	xorg-server
	xorg-xinit
	xorg-xkill
	xorg-xrandr
	xsel
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
	redshift-minimal # change screen temperature
	sc-im
	slack-desktop
	stylua
	todotxt
	toipe # touch typing game
	whatsapp-nativefier
	vocage # flashcard terminal-based app
)

PYTHON_PACKAGES=(
	pyright
	python-black
	python-isort
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
	sudo pacman -S "${PACMAN_PACKAGES[@]}" --noconfirm
}

install_paru() {
	git clone https://aur.archlinux.org/paru.git "$HOME/apps/paru"
	cd "$HOME/apps/paru"
	makepkg -si
}

install_AUR_packages() {
	sudo pacman -S "${AUR_PACKAGES[@]}" --noconfirm
}

install_pyenv() {
	curl https://pyenv.run | bash
}

install_python_packages() {
	sudo pacman -S "${PYTHON_PACKAGES[@]}" --noconfirm
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
	sudo cp -a ./themes/Material-Black-Blueberry/ /usr/share/themes/
	sudo cp -a ./icons/Material-Black-Blueberry-Suru/ /usr/share/icons/
}

ssh_key() {
	ssh-keygen
}

setup_repos() {
	git clone git@github.com:gustavobrangel/dotfiles.git "$HOME/"
	git clone git@github.com:gustavobrangel/scripts.git "$HOME/.config"
}

# ========== ========== ========== ========== functions call

install_pacman_packages
install_AUR_packages
install_pyenv
install_pip_packages
setup_git
setup_vim
change_shell
gtk_theming
ssh_key
setup_repos
upgrade_and_clean_system
