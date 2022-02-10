#!/bin/bash

function run {
	if ! pgrep $(basename $1); then
		$@ &
	fi
}

feh --no-fehbg --bg-fill --randomize $HOME/drive/wallpapers/* &

run sxhkd -c ~/.config/misc/sxhkdrc &

#starting utility applications at boot time
numlockx &
picom --config $HOME/.config/misc/picom.conf &
xautolock -time 30 -locker slock &
sh $HOME/scripts/remaps.sh
insync start &
# /usr/lib/xfce4/notifyd/xfce4-notifyd &

# run xfce4-power-manager &
#starting user applications at boot time
# run telegram-desktop &
