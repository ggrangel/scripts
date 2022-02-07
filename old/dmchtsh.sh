#!/usr/bin/bash

languages=(
    python
    bash
    latex
)

lang=$(printf '%s\n' "${languages[@]}" | dmenu -p "Language:" | sed 's/\ /+/g')

if [[ $lang == "" ]]; then
    exit 1;
fi

query=$(echo "" | dmenu -p "Query:" | sed s/\ /+/g)

if [[ $query != "" ]] ; then
    $TERMINAL -e $SHELL -lc "curl 'cht.sh/$lang/$query'\?T | vim -"
else
    $TERMINAL -e $SHELL -lc "curl 'cht.sh/$lang/'\?T | vim -"
fi
