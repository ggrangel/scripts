#!/bin/bash

# This script is called to take a screenshot of all the screens, a specific region or a window.
# There are sxhkd's keybindings to all its options

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
