#!/usr/bin/env fish

set nextdns_status (sudo nextdns status)

if test $nextdns_status = running
    sudo nextdns stop
    sketchybar --set $NAME icon=輦
else
    sudo nextdns start
    sketchybar --set $NAME icon=聯
end
