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
# insync
# picom
# redshift
# sxhkd
# volnoti
# xautolock
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
sxhkd -c ~/.config/sxhkd/sxhkdrc &
python ~/scripts/wallpaper.py set &
run picom --config ~/.config/picom.conf &
redshift -P -O 5000 &
run xautolock -time 60 -locker "systemctl suspend" &
run volnoti &
run insync start && sleep 5 && insync start # for some very weird reason, that's the only wait I got insync to work here

hostName=$(cat /etc/hostname)
sxhkd -c ~/.config/sxhkd/sxhkdrc."$hostName" &
