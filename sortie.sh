#!/bin/bash

# Call this script whenever you want to lock, reboot or shutdown the system
# A rofi window will popup
# There is a shxkd keybinding to call it.

options=(
	"Lock Screen"
	"Reboot"
	"Shutdown"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'Choose')

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
