#!/usr/bin/env fish

sketchybar --animate tanh 10 --set $NAME icon.highlight=$SELECTED

set space (string sub -s 7 $NAME)
if $SELECTED = true
    if test "$space" = 1
        sketchybar --set space_6 label=home
    else if test "$space" = 2
        sketchybar --set space_6 label=school
    else if test "$space" = 3
        sketchybar --set space_6 label=chat
    else if test "$space" = 4
        sketchybar --set space_6 label=code
    else if test "$space" = 5
        sketchybar --set space_6 label=music
    else if test "$space" = 6
        sketchybar --set space_6 label=other
    end
end
