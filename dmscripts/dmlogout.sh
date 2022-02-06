#!/bin/sh

declare -a options=(
	"Lock Screen"
	"Quit Qtile"
	"Reboot"
	"Shutdown"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'Choose')

case $choice in
'Lock Screen')
	# $HOME/scripts/locker.sh
	slock
	;;
'Quit Qtile')
	qtile cmd-obj -o cmd -f shutdown
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
