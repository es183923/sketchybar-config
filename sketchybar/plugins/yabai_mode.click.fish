#!/usr/bin/env fish

set layout (yabai -m query --spaces --space | jq -r '.type')

switch $layout
    case bsp
        yabai -m space --layout stack
    case stack
        yabai -m space --layout float
    case float
        yabai -m space --layout bsp
end

sketchybar --set $NAME label=(yabai -m query --spaces --space | jq -r '.type')
