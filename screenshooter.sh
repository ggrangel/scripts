#!/bin/bash

defaultFolder="$HOME/tmp"
defaultName=$(date +%s)

name=$(echo "$defaultName" | dmenu -fn "" -p "Rename SS?")

if [[ $name == "" ]]; then
	exit 1
fi

imagePath="$defaultFolder/$name".png

case $1 in
'screen')
	maim "$imagePath"
	;;
'window')
	maim -i "$(xdotool getactivewindow)" "$imagePath"
	;;
'select')
	maim -s "$imagePath"
	;;
*)
	exit 0
	;;
esac

xclip -selection clipboard -t image/png -i "$imagePath"
