#!/bin/sh

# This script is called on startup to:
# 1. increase the key rate speed
# 2. change the behaviour of the caps lock key: map it to escape, but when it's pressed alongside another key, it's mapped to control
# 2. map the right alt to the super key.

# Increase key speed via a rate change.
# xset r rate [delay] [rate]
# xset r rate 300 75

# Map the caps lock key to control...
setxkbmap -option ctrl:nocaps

# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null
xcape -e 'Control_L=Escape'

# Map the right alt to left super as well.
xmodmap -e 'remove mod1 = Alt_R'
xmodmap -e 'keycode 108 = Super_L'
xmodmap -e 'clear mod4'
xmodmap -e 'add mod4 = Super_R'
xmodmap -e 'add mod4 = Super_L'
