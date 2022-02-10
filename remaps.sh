#!/bin/sh

# Increase key speed via a rate change.
# xset r rate [delay] [rate]
xset r rate 300 75

# Map the caps lock key to control...
setxkbmap -option ctrl:nocaps

# But when it is pressed only once, treat it as escape.
killall xcape 2>/dev/null ; xcape -e 'Control_L=Escape'

# Map the altgr button to left super as well.
# xmodmap -e 'keycode 108 = Super_L'
