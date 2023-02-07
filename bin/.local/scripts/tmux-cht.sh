#!/usr/bin/env bash

selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht-commands | fzf)
if [[ -z $selected ]]: then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=$(echo $query | tr ' ' '+')
    tmux neww ksh -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww ksh -c "curl -s cht.sh/$selected/$query | less"
fi

