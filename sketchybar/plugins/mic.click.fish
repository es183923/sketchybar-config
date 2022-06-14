#!/usr/bin/env fish

set mic_volume (osascript -e 'input volume of (get volume settings)')

if test $mic_volume -eq 0
    osascript -e 'set volume input volume 50'
    sketchybar --set $NAME icon="" icon.color=0xFFFFFFFF
else if test $mic_volume -gt 0
    osascript -e 'set volume input volume 0'
    sketchybar --set $NAME icon="" icon.color=0xFFE04F4F
end
