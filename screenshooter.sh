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
defaultName=$(date "+%y%m%d-%H_%M_%S")

mkdir -p "$defaultFolder"

imagePath="$defaultFolder$defaultName.png"

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

notify-send 'Screenshooter' "Screenshot saved to $imagePath"
xclip -selection clipboard -t image/png -i "$imagePath" # copy image to clipboard
printf "%s" "$imagePath" | xclip -selection primary # copy image path to primary clipboard (mouse middle click)
