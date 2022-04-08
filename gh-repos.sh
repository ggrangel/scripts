#!/bin/bash

# Check status of my github repos

REPOS=( 
"/home/rangelgbr/.password-store/"
"/home/rangelgbr/dotfiles/"
"/home/rangelgbr/scripts/"
)

for repo in "${REPOS[@]}"; do
    printf "\nRepo: %s\n" "$repo"
    cd "$repo" && git status
done
