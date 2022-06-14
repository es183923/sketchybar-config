#!/usr/bin/env fish

set space_id (echo $NAME | string replace "space_" "")
yabai_ -m space --focus $space_id
