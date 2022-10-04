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

sh ~/scripts/remaps.sh &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
picom --config ~/.config/picom.conf &
redshift -P -O 5000
python ~/scripts/wallpaper.py set &
insync start &
xautolock -time 60 -locker "systemctl suspend"
volnoti &

hostName=$(cat /etc/hostname)
if [[ $hostName == "core" ]]; then
    sxhkd -c ~/.config/sxhkd/sxhkdrc.core &
elif [[ $hostName == "aux" ]]; then
    sxhkd -c ~/.config/sxhkd/sxhkdrc.aux &
fi
