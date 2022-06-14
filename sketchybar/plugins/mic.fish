#!/usr/bin/env fish

set mic_volume (osascript -e 'input volume of (get volume settings)')

if test $mic_volume -eq 0
    sketchybar --set $NAME icon=""
else if test $mic_volume -gt 0
    sketchybar --set $NAME icon=""
end
