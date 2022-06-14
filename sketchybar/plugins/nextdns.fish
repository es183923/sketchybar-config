#!/usr/bin/env fish

set nextdns_status (sudo nextdns status)

if test $nextdns_status = running
    sketchybar --set $NAME icon=聯
else
    sketchybar --set $NAME icon=輦
end
