#!/bin/bash
#
# Checks the status of my main github repos
#
# Usage:
#
# ```sh
# $ ./gh-repos.sh
# ```
#
# Dependencies:
#
# git

REPOS=(
	"$HOME/.password-store/"
	"$HOME/.config/"
	"$HOME/scripts/"
)

for repo in "${REPOS[@]}"; do
	printf "\nRepo: %s\n" "$repo"
	cd "$repo" && git status
done
