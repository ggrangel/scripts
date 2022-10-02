#!/usr/bin/bash
#
# Installs paru, pacman packages and AUR packages
#
# Usage:
#
# ```sh
# $ ./heyarch.sh
# ```
#
# Dependencies:
#
# git

PACMAN_PACKAGES=(
	awesome
	base-devel
	bat       # rust's alternative to cat
	git-delta # a syntax-highlighting pager for git
	dmenu
	feh
	fd  # rust's alternative to find
	fzf # used by zoxide
	github-cli
	htop
	kitty
	kvantum-qt5 # apply gtk themes to qt programs
	lazygit
	maim
	ncdu # sort and list disk usage by size
	neofetch
	neovim
	noto-fonts
	pass
	pcmanfm # sometimes it is useful
	picom
	pulsemixer
	ranger
	redshift
	ripgrep # rust's alternative to grep
	rofi
	rmlint # removes duplicate files (useful for the wallpaper folder)
	rsync
	slack-desktop
	# slock
	stow
	sxhkd
	sxiv # project archived. consider migrating to nsxiv later on
	telegram-desktop
	tldr
	tmux
  trash-cli
	ttf-dejavu
	ttf-liberation
	udisks2  # avoids having to type sudo pass with bashmount
	ueberzug # ranger preview image
	unzip    # for :LspInstall
	wmctrl   # interacts with an X window manager
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
    # colorpicker
    devour
    dtrx # extract compressed files
    i3lock-fancy-git
    insync
    nerd-fonts-complete
    nvim-packer-git
    redshift-minimal # change screen temperature
    sc-im
    slack-desktop
    slock-fancy-git # slock is not working properly alongside suspension service
    todotxt
    toipe # touch typing game
    whatsapp-nativefier
    vocage  # flashcard terminal-based app
    volnoti # volume notification
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
