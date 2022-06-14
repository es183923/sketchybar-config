#!/usr/bin/env fish

set data (yabai -m query --windows --window 2> /dev/null)

# app name
set app_name (echo $data | jq -r '.app')
set has_app_name (test -z $app_name; and echo false; or echo true)

set max_app_length 19
set max_title_length 39
set display_id (yabai -m query --displays | jq -r '.[] | .uuid')
if test "$display_id" = '4F66D0C3-C8B2-3E59-0857-D6964E3302DB' # built-in display
    set max_app_length 29
    set max_title_length 59
end

if $has_app_name
    test (string length -- $app_name) -gt $max_app_length; and set app_name (string sub -l $max_app_length $app_name)"…"
end

# window title
set window_title (echo $data | jq -r '.title')
set has_window_title (test -z $window_title; and echo false; or echo true)

if $has_window_title
    test (string length -- $window_title) -gt $max_title_length; and set window_title (string sub -l $max_title_length $window_title)"…"
end

# window properties
set floating (echo $data | jq -r '."is-floating"')
set topmost (echo $data | jq -r '."is-topmost"')
set sticky (echo $data | jq -r '."is-sticky"')
set zoom_fullscreen (echo $data | jq -r '."has-zoom-fullscreen"')
set zoom_parent (echo $data | jq -r '."has-zoom-parent"')

set properties ''
test "$floating" = true; and set properties $properties"~"
test "$topmost" = true; and set properties $properties"^"
test "$zoom_fullscreen" = true; and set properties $properties"f"
test "$zoom_parent" = true; and set properties $properties"p"
test "$sticky" = true; and set properties $properties"*"

if not test -z "$properties"
    if $has_app_name
        set window_title "$window_title [$properties]"
    else
        set window_title "[$properties]"
    end
end

# setting items
sketchybar \
    --set app_name \
    label="$app_name" \
    drawing=$has_app_name \
    --set window \
    label="$window_title" \
    drawing=$has_window_title
