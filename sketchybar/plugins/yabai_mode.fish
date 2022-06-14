#!/usr/bin/env fish

set layout (yabai -m query --spaces --space | jq -r '.type')

sketchybar --set $NAME label=$layout
