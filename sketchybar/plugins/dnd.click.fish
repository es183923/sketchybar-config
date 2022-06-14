#!/usr/bin/env fish

set focus (whichfocus)

if test $focus = "No focus"
    shortcuts run 'Turn on DND'
    sketchybar --set dnd icon=􀆺
else
    shortcuts run 'Turn off DND'
    sketchybar --set dnd icon=􀆹
end
