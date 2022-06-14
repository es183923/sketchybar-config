#!/usr/bin/env fish

set core_count (sysctl -n machdep.cpu.thread_count)
set cpu_info (ps -eo pcpu,user | tail -n +2)

set cpu_total 0
set cpu_user 0

for a in $cpu_info
    set user (string match --regex "[A-Za-z]+" $a)
    set percent (string match --regex "[\d.]+" $a)
    if not test $user = "eric"
        set cpu_sys (math "$cpu_sys+$percent")
    end
    set cpu_total (math "$cpu_total+$percent")
end

sketchybar \
    --push cpu_sys (math "$cpu_sys/($core_count*100)") \
    --push cpu_total (math "$cpu_total/($core_count*100)")
