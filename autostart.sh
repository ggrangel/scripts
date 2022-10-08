#!/bin/bash
#
# Runs scripts and programs at startup.
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
# xautolock
# volnoti
#
# Console output: PID of all the started process
#

# checks wether there is already an instance of the program with the same arguments
# and only runs the program if there is none
run() {
    if ! pgrep -f "$1" ;
    then
        "$@"&
    fi
}

~/scripts/remaps.sh &
run sxhkd -c ~/.config/sxhkd/sxhkdrc &
python ~/scripts/wallpaper.py set &
run picom --config ~/.config/picom.conf &
redshift -P -O 5000 &
run xautolock -time 60 -locker "i3lock-fancy && systemctl suspend" &
run volnoti &

hostName=$(cat /etc/hostname)
if  [[ $hostName == "core" ]] ; then
    run sxhkd -c ~/.config/sxhkd/sxhkdrc.core &
elif [[ $hostName == "aux" ]]; then
    run sxhkd -c ~/.config/sxhkd/sxhkdrc.aux &
fi
