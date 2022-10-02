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
	awesome # window manager
  aws-cli
	base-devel
	bat       # rust's alternative to cat
  git-delta # a syntax-highlighting pager for git (lazygit dependency)
	dmenu
	feh
	fd  # rust's alternative to find
	fzf # used by zoxide
	github-cli
	htop
	kitty # terminal emulator
	kvantum-qt5 # apply gtk themes to qt programs
	lazygit # git simplified
	maim # terminal screenshot application
	ncdu # sort and list disk usage by size
	neofetch # command-line system information tool
	neovim 
	noto-fonts
	pass
	pcmanfm # GUI file manager: sometimes it is useful
	picom
	pulsemixer # controls audio input and output
	ranger
	redshift # changes screen temperature
	ripgrep # rust's alternative to grep
  rofi # application launcher (dmenu alternative)
	rmlint # removes duplicate files (useful for the wallpaper folder)
	rsync
	sxhkd # setup system shortcuts
	sxiv # project archived. consider migrating to nsxiv later on
	telegram-desktop
	tldr # community-driven manual pages
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
  zsh # smarter cd (like z and autojump)
	zsh-syntax-highlighting
)

AUR_PACKAGES=(
    bashmount
    brave-bin
    # colorpicker
    devour # terminal swallower
    dtrx # extract compressed files
    i3lock-fancy-git
    insync
    nerd-fonts-complete
    nvim-packer-git
    sc-im # terminal spreadsheet
    # slock-fancy-git # slock is not working properly alongside suspension service
    todotxt
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
