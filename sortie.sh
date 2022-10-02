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
# i3lock-fancy
# awesome

options=(
    "Lock Screen"
    "Restart AwesomeWM"
    "Quit AwesomeWM"
    "Suspend System"
    "Reboot System"
    "Shutdown System"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -p 'Action')

case $choice in
    'Lock Screen')
        i3lock-fancy
        ;;
    'Restart AwesomeWM')
        awesome-client 'awesome.restart()'
        ;;
    'Quit AwesomeWM')
        awesome-client 'awesome.quit()'
        ;;
    'Suspend System')
        systemctl suspend
        ;;
    'Reboot System')
        shutdown now -r
        ;;
    'Shutdown System')
        shutdown now
        ;;
    *)
        exit 0
        ;;
esac
