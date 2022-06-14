#!/bin/zsh

data=$(pmset -g batt)
battery_percent=$(echo $data | grep -Eo "\d+%" | cut -d% -f1)
charging=$(echo $data | grep 'AC Power')

case "$battery_percent" in
    100)    icon="" color=0xFF5DFE67 ;;
    9[0-9]) icon="" color=0xFF5DFE67 ;;
    8[0-9]) icon="" color=0xFF5DFE67 ;;
    7[0-9]) icon="" color=0xFF5DFE67 ;;
    6[0-9]) icon="" color=0xFF5DFE67 ;;
    5[0-9]) icon="" color=0xFF5DFE67 ;;
    4[0-9]) icon="" color=0xFFFFD300 ;;
    3[0-9]) icon="" color=0xFFFFD300 ;;
    2[0-9]) icon="" color=0xFFFFD300 ;;
    1[0-9]) icon="" color=0xFFFF4500 ;;
    *)      icon="" color=0xFFFF4500 ;;
esac

# if is charging
if ! [ -z "$charging" ]; then
    icon="${icon}"
fi

sketchybar \
    --set $NAME \
        icon.color="$color" \
        icon="$icon" \
        label="${battery_percent}%"



