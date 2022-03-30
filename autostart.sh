#!/bin/bash

# This script is called on startup by a window manager

function run {
	if ! pgrep $(basename $2); then
		$@ &
	fi
}

python ~/scripts/wallpapers.py --set &
run sxhkd -c ~/.config/sxhkdrc &
sh ~/scripts/remaps.sh &
picom --config ~/.config/picom.conf &
redshift -P -O 5000
run telegram-desktop &
insync start &
xautolock -time 30 -locker slock &
xset s off & # disable auto screen saver blanking
run kitty &
