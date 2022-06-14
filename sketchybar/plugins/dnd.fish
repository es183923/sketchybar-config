#!/usr/bin/env fish

set focus (whichfocus)

if test $focus = "No focus"
    sketchybar --set dnd icon=􀆹
else
    sketchybar --set dnd icon=􀆺
end

