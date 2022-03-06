#!/bin/bash

# This script is called by a vim command to refresh the web page I'm working on whenever I save the whole project.

xdotool search --name "$1" windowactivate --sync && xdotool key ctrl+r
