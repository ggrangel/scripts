#!/bin/bash
#
# Makes a popup window so the user can choose between:
# - lock Screen
# - restart awesomeWM
# - quit aweromewm
# - reboot system
# - shutdown system
#
# Usage:
#
# ```sh
# $ ./sortie.sh
# ```
#
# Dependencies:
#
# rofi
# slock
# awesome

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
