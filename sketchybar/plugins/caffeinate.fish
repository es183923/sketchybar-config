#!/usr/bin/env fish

if test -z (pgrep -x 'caffeinate')
    sketchybar --set $NAME icon="﯈"
else
    sketchybar --set $NAME icon=""
end
