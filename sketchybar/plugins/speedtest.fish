#!/usr/bin/env fish

set json (speedtest -f json-pretty)

set report_url (echo "$json" | jq -r '.result.url')

set ping (echo "$json" | jq -r '.ping.latency')
set bps_down (echo "$json" | jq -r '.download.bandwidth')
set bps_up (echo "$json" | jq -r '.upload.bandwidth')

set divide_to_mbps 125000
set mbps_down (echo "scale=2; $bps_down / $divide_to_mbps" | bc)
set mbps_up (echo "scale=2;   $bps_up / $divide_to_mbps" | bc)

sketchybar --set $NAME label="↓ {$mbps_down}mbps  ↑ {$mbps_up}mbps  ↔ {$ping}ms"
