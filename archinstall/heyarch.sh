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
    awesome             # window manager
    base-devel          # package group that includes tools for building packages
    bat                 # rust's alternative to cat
    dmenu               # dynamic menu (rofi dependency)
    fd                  # rust's alternative to find
    feh                 # sxiv is the default imageviewer. feh is used to set wallpapers
    fzf                 # used by zoxide
    git-delta           # a syntax-highlighting pager for git (lazygit dependency)
    htop                # interactive process viewer
    kitty               # terminal emulator
    kvantum-qt5         # apply gtk themes to qt programs
    lazygit             # git simplified
    libnotify           # for notify-send command
    lsd                 # ls deluxe
    maim                # terminal screenshot application
    mcfly               # search shell history
    ncdu                # sort and list disk usage by size
    neofetch            # command-line system information tool
    neovim
    noto-fonts          # set of fonts
    openssh             # for ssh-keygen
    pass                # standard unix password manager
    pcmanfm             # GUI file manager: sometimes it is useful
    picom               # standalone compositor for Xorg
    pulsemixer          # controls audio input and output
    ranger              # console file manager
    redshift            # changes screen temperature
    ripgrep             # rust's alternative to grep
    rmlint              # removes duplicate files (useful for the wallpaper folder)
    rofi                # application launcher (dmenu alternative)
    sxhkd               # setup system shortcuts
    sxiv                # project archived. consider migrating to nsxiv later on
    telegram-desktop
    tldr                # community-driven manual pages
    ttf-dejavu          # set of fonts
    ttf-liberation      # set of fonts
    udisks2             # avoids having to type sudo password with bashmount
    ueberzug            # ranger preview image
    unzip               # for :LspInstall
    wmctrl              # interacts with an X window manager
    xautolock           # monitors user activity on an X Window display (necessary for auto suspension after idle time)
    xcape               # change keymaps
    xclip               # used by the screenshot script to copy image to clipboard
    xdotool             # simulates keyboard input and mouse activity
    xorg-server         # implementation of the xorg
    xorg-xinit          # allows user to manually start an Xorg display server
    xorg-xkill          # forces the X server to close connections to client
    xorg-xrandr         # used by the wallpapers scripts to count the number of connected monitors
    xsel                # command line tool to copy to clipboard (tldr xsel to remember how to use it)
    zathura             # document viewer
    zathura-pdf-poppler # reads pdf in zathura
    zoxide              # smarter cd (like z and autojump)
    zsh                 # command-line interpreter with more features than bash
    zsh-syntax-highlighting
)

AUR_PACKAGES=(
    bashmount           # command-line utility to easily manage removable media
    brave-bin           # web browser
    devour              # terminal swallower
    dtrx                # extract compressed files
    i3lock-fancy-git    # screen locker
    insync              # sync local folder to google drive
    nerd-fonts-complete # set of nerd fonts
    nvim-packer-git     # nvim package manager
    sc-im               # terminal spreadsheet
    todotxt             # todo list app
    volnoti             # volume notification
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
