#!/usr/bin/env fish

if test -z (pgrep -x 'caffeinate')
    caffeinate & disown
    sketchybar --set $NAME icon=""
else
    killall caffeinate
    sketchybar --set $NAME icon="﯈"
end
