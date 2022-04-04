#!/bin/bash

# -------------------------------------------------------------------------- #
# Call this script whenever you want to lock, reboot or shutdown your system. 
# A rofi window will popup to select the action.
#
# Dependencies: rofi
# -------------------------------------------------------------------------- #

options=(
	"Lock Screen"
    "Restart AwesomeWM"
    "Quit AwesomeWM"
	"Reboot"
	"Shutdown"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'Action')

case $choice in
'Lock Screen')
	slock
	;;
'Restart AwesomeWM')
    awesome-client 'awesome.restart()'
    ;;
'Quit AwesomeWM')
    awesome-client 'awesome.quit()'
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
