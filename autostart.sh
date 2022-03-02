#!/bin/bash

function run {
	if ! pgrep $(basename $1); then
		$@ &
	fi
}

feh --no-fehbg --bg-fill --randomize $HOME/drive/wallpapers/* &
run sxhkd -c ~/.config/misc/sxhkdrc &
sh $HOME/scripts/remaps.sh &
# dunst &
picom --config $HOME/.config/misc/picom.conf &
run brave &
run telegram-desktop &
run whatsapp-nativefier &
insync start &
lxsession &
xautolock -time 30 -locker slock &
run kitty &
