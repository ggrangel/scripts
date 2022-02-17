#!/bin/bash

if ! tmux has-session -t newsweek; then
	tmux new -s newsweek -n "dev" -d
	tmux new-window -n "dotfiles" -t newsweek:2
	tmux new-window -n "images" -t newsweek:3
	tmux send-keys -t newsweek:1 "cd $HOME/projects/altcademy/html-css/newsweek/newsweek/ && v index.html" Enter
	tmux send-keys -t newsweek:2 "cd $HOME/.config/ && v ." Enter
	tmux send-keys -t newsweek:3 "cd $HOME/projects/altcademy/html-css/newsweek/newsweek/images/ && rangercd" Enter
	tmux select-window -t newsweek:1
	tmux attach-session
fi
