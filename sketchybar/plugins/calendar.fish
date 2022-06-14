#!/usr/bin/env fish

set day (date +'%d')

set items (cal -h)


for line in $items
end

sketchybar --set $NAME label=(date +'%a %b %-e')
