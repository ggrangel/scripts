#!/usr/bin/bash

declare -a options=(
	"misc - $HOME/.config/misc/"
	"nvim - $HOME/.config/nvim/"
	"qtile - $HOME/.config/qtile/"
	"scripts - $HOME/scripts"
	"thesis - $HOME/projects/masters/thesis/"
	"zsh - $HOME/.config/zsh/"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -sort -p 'Edit file' | awk '{print $NF}' | xargs -t)

if [[ -n "$choice" ]]; then
	$TERMINAL -e "$EDITOR" "$choice"
fi
