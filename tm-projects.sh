#!/bin/bash

airbnb() {
	project="airbnb"

	if ! tmux has-session -t "$project"; then
		tmux new -s "$project" -n "dev" -d
		tmux new-window -n "dotfiles" -t "$project":2
		tmux new-window -n "images" -t "$project":3
		tmux send-keys -t "$project":1 "cd $HOME/projects/altcademy/html-css/$project/ && v index.html" Enter
		tmux send-keys -t "$project":2 "cd $HOME/.config/ && v ." Enter
		tmux send-keys -t "$project":3 "cd $HOME/projects/altcademy/html-css/$project/images/ && rangercd" Enter
		tmux select-window -t "$project":1
	fi
	cd "$HOME/projects/altcademy/html-css/$project/" && brave --new-window index.html
	tmux attach -t "$project"
}

newsweek() {
	project="newsweek"

	if ! tmux has-session -t "$project"; then
		tmux new -s "$project" -n "dev" -d
		tmux new-window -n "dotfiles" -t "$project":2
		tmux new-window -n "images" -t "$project":3
		tmux send-keys -t "$project":1 "cd $HOME/projects/altcademy/html-css/$project/newsweek/ && v index.html" Enter
		tmux send-keys -t "$project":2 "cd $HOME/.config/ && v ." Enter
		tmux send-keys -t "$project":3 "cd $HOME/projects/altcademy/html-css/$project/newsweek/images/ && rangercd" Enter
		tmux select-window -t "$project":1
		tmux attach-session
	else
		tmux attach -t "$project"
	fi

}

airbnb
