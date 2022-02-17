#!/bin/bash

xdotool search --name $1 windowactivate --sync && xdotool key ctrl+r

