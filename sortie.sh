#!/bin/bash

# -------------------------------------------------------------------------- #
# Call this script whenever you want to lock, reboot or shutdown your system. 
# A rofi window will popup to select the action.
#
# Dependencies: rofi
# -------------------------------------------------------------------------- #

options=(
	"Lock Screen"
	"Reboot"
	"Shutdown"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'Action')

case $choice in
'Lock Screen')
	slock
	;;
'Reboot')
	shutdown now -r
	;;
'Shutdown')
	shutdown now
	;;
*)
	exit 0
	;;
esac
