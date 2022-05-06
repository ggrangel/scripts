#!/bin/bash
#
# Adjusts the volume and displays the change as a notification.
#
# Usage:
#
# ```sh
# $ ./volume.sh up
# $ ./volume.sh down
# $ ./volume.sh toggle_mute
# ```
#
# Dependencies:
#
# - volnoti
# - pulsemixer

function get_volume {
	pulsemixer --get-volume | cut -d ' ' -f 1
}

function is_muted {
	pulsemixer --get-mute
}

function send_notification {
	volnoti-show "$(get_volume)"
}

case $1 in
up)
	pulsemixer --unmute
	pulsemixer --change-volume +10
	send_notification
	;;
down)
	pulsemixer --unmute
	pulsemixer --change-volume -10
	send_notification
	;;
toggle_mute)
	pulsemixer --toggle-mute
	if [[ "$(is_muted)" == "1" ]]; then
		volnoti-show -m
	else
		send_notification
	fi
	;;
esac
