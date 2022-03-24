#!/bin/bash

# This script is called on startup by a window manager

function run {
	if ! pgrep $(basename $1); then
		$@ &
	fi
}

feh --no-fehbg --bg-fill --randomize ~/drive/wallpapers/selected/* &
run sxhkd -c ~/.config/misc/sxhkdrc &
sh ~/scripts/remaps.sh &
# dunst &
picom --config ~/.config/misc/picom.conf &
# run brave &
redshift -P -O 5000
run telegram-desktop &
# run whatsapp-nativefier &
insync start &
# lxsession &  # authentication agent
xautolock -time 30 -locker slock &
xset s off # disable auto screen saver blanking
run kitty &
