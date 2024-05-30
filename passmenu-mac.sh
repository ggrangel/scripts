#!/bin/bash
#
# Makes a popup to choose and copy a password to clipboard
#
# Usage:
# ```bash
# ./passmenu.sh
# ```
#
# Dependencies:
# fzf
# pass
#

# prefix=${PASSWORD_STORE_DIR} # doesn't work when called via skhd keybinding

prefix=/Users/ggrangel/.password-store/
password_files=("$prefix"/{*,**/*}.gpg)
password_files=("${password_files[@]#"$prefix"/}")
password_files=("${password_files[@]%.gpg}")

password=$(printf '%s\n' "${password_files[@]}" | dmenu-mac "$@")

# printf '%s\n' "${password_files[@]}" | dmenu-mac "$@" | xargs pass -c

# [[ -n $password ]] || exit

pass -c "$password"
