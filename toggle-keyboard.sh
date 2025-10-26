#!/usr/bin/env bash
kb="sonix-aula-f75max"           # <-- change this to your keyboard id

# ------------------------------------------------------------------
# Switch to the next layout
# ------------------------------------------------------------------
hyprctl switchxkblayout "$kb" next

result=$(/home/$USER/.local/bin/utils/get-active-layout.sh)
# ------------------------------------------------------------------
# Show the notification
# ------------------------------------------------------------------
hyprctl notify 1 5000 "rgb(40a02b)" \
    "Switch on Keyboard: $kb to $result" 
