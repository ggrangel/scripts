#!/bin/sh

# This script is called on startup to:
# - increase the key rate speed
# - hold both shifts to toggle between us and br keyboard layouts.
# - change the behaviour of the caps lock key: map it to super, but when it's pressed only once, treat it as escape
# - map the right alt to the super key.
#
# Usage:
#
# Called by autostart.sh.
# No need to run it manually.
#
# Dependencies:
#
# xcape

# Increase key speed via a rate change.
# xset r rate [delay] [rate]
xset r rate 300 75

# Map the caps lock key to super.
setxkbmap us,br -option caps:super,grp:ctrl_alt_toggle
#setxkbmap us -option caps:super

# But when it is pressed only once, treat it as escape.
# killall xcape 2>/dev/null
xcape -e 'Super_L=Escape'

## For a good explanation on xmodmap:
## https://askubuntu.com/questions/137172/how-to-remap-super-left-key-to-control-key
# Map the right alt to left super as well.
xmodmap -e 'remove mod1 = Alt_R'
xmodmap -e 'clear mod4'
xmodmap -e 'add mod4 = Alt_R'
xmodmap -e 'add mod4 = Super_R'
xmodmap -e 'add mod4 = Super_L'
