#!/bin/sh

# This script is called on startup to:
# - increase the key rate speed
# - set the main keyboard layout to us colemak.
# - binds super + space to toggle to br qwerty.
# - change the behaviour of the caps lock key: map it to escape, but when it's pressed alongside another key, it's mapped to control
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

# Map the caps lock key to control...
setxkbmap us,br -variant colemak, -option ctrl:nocaps,grp:win_space_toggle

# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null
xcape -e 'Control_L=Escape'

# Map the right alt to left super as well.
xmodmap -e 'remove mod1 = Alt_R'
xmodmap -e 'keycode 108 = Super_L'
xmodmap -e 'clear mod4'
xmodmap -e 'add mod4 = Super_R'
xmodmap -e 'add mod4 = Super_L'
