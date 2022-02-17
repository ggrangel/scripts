#!/bin/bash

if ! tmux has-session -t newsweek; then
	tmux new -s newsweek -n "dev" -d
	tmux new-window -n "dotfiles" -t newsweek:2
	tmux new-window -n "images" -t newsweek:3
	tmux send-keys -t newsweek:1 "v ~/projects/altcademy/html-css/newsweek/newsweek/index.html" Enter
	tmux send-keys -t newsweek:2 "v ~/.config/" Enter
	tmux send-keys -t newsweek:3 "ranger ~/projects/altcademy/html-css/newsweek/newsweek/images/" Enter
    tmux select-window -t newsweek:1
    tmux attach-session
fi
