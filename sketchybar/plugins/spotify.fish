#!/usr/bin/env fish

sleep 1
set state (spotify status state)

if test $state = "not running"
    echo 'Spotify is not running'
    sketchybar --set $NAME label="Not playing"
    exit 0
end

set track (spotify status track)
set artist (spotify status artist)
set has_artist (test -z $artist; and echo false; or echo true)

set max_track_length 14
set max_artist_length 14

set display_id (yabai -m query --displays | jq -r '.[] | .uuid')
if test "$display_id" = 4F66D0C3-C8B2-3E59-0857-D6964E3302DB # built-in display
    set max_track_length 29
    set max_artist_length 49
end

if test (string length -- $track) -gt $max_track_length
    set track (string sub -l $max_track_length $track)"…"
end

if $has_artist
    if test (string length -- $artist) -gt $max_artist_length
        set track (string sub -l $max_artist_length $artist)"…"
    end
end

set label "Not playing"

if $has_artist
    set label "$track - $artist"
else
    set label "$track"
end

set icon ''
if test $state = paused
    set icon ''
end

sketchybar --set $NAME label=$label icon=$icon
