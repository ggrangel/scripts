#!/usr/bin/bash

PACMAN_PACKAGES=(
	awesome
	base-devel
	cmatrix
	# codespell
	git-delta # a syntax-highlighting pager for git (used with lazygit)
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
	tldr
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

install_pacman_packages() {
	for package in "${PACMAN_PACKAGES[@]}"; do
		sudo pacman -S "$package" --noconfirm
	done
}

install_paru() {
	git clone https://aur.archlinux.org/paru.git "$HOME/apps/paru"
	cd "$HOME/apps/paru"
	makepkg -si
}

install_AUR_packages() {
	for package in "${AUR_PACKAGES[@]}"; do
		paru -S "$package" --noconfirm
	done

}

upgrade_and_clean_system() {
	sudo pacman -Syu --noconfirm
	sudo pacman -Scc --noconfirm # clean cache
}

install_paru
install_pacman_packages
install_AUR_packages
upgrade_and_clean_system
