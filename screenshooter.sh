#!/bin/bash
#
# Screenshoot a region, window or all screens, save it to a folder and copy it to clipboard
#
# Usage:
#
# ```sh
# $ ./screenshooter.sh select
# $ ./screenshooter.sh window
# $ ./screenshooter.sh screen
# ```
#
# Dependencies:
#
# maim
# xclip

defaultFolder="$HOME/tmp/screenshots/"
defaultName=$(date +%s)

mkdir -p "$defaultFolder"

imagePath="$defaultFolder/$defaultName".png

case $1 in
'screen')
	maim "$imagePath"
	notify-send 'Screenshooter' "Screen print saved to $imagePath"
	;;
'window')
	maim -i "$(xdotool getactivewindow)" "$imagePath"
	notify-send 'Screenshooter' "Window print saved to $imagePath"
	;;
'select')
	maim -s "$imagePath"
	notify-send 'Screenshooter' "Region print saved to $imagePath"
	;;
*)
	exit 0
	;;
esac

xclip -selection clipboard -t image/png -i "$imagePath"
