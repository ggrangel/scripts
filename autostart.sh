#!/bin/bash
#
# Runs all scripts and programs necessary at startug.
#
# Usage:
# This is script is called by the WM at startup.
# Do not run it manually.
#
# Dependencies (all are optional):
#
# sxhkd
# picom
# redshift
# insync
# xautolock
# volnoti

function run {
	if ! pgrep $(basename $2); then
		$@ &
	fi
}

python ~/scripts/wallpaper.py set &
sh ~/scripts/remaps.sh &
run sxhkd -c ~/.config/sxhkd/sxhkdrc &
picom --config ~/.config/picom.conf &
redshift -P -O 5000
insync start &
xautolock -time 45 -locker "systemctl suspend"
volnoti &

hostName=$(cat /etc/hostname)
if [[ $hostName == "core" ]]; then
	run sxhkd -c ~/.config/sxhkd/sxhkdrc.core &
elif [[ $hostName == "aux" ]]; then
	run sxhkd -c ~/.config/sxhkd/sxhkdrc.aux &
fi
