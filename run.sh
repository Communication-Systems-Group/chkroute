#!/bin/bash
trace_command=tracepath
command -v tracepath >/dev/null 2>&1 || { echo >&2 "tracepath is required but it's not installed.  Checking if traceroute is installed."; trace_command=traceroute; }
command -v traceroute >/dev/null 2>&1 || { echo >&2 "traceroute is required but it's not installed.  Aborting."; exit 1; }
for i in {1..20}
do
        if [ -s nc_log ]
        then
                grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' nc_log > ip
                sed -n 2p < ip > oneip
                oneip=$(cat oneip)
                if [ "$trace_command" = "tracepath" ]
                then
                        tracepath -n $oneip | awk -F" " '{ if(NR!=1) print $2 }'  > trace_path
                        head -n -2 trace_path > trace
                elif [ "$trace_command" = "traceroute" ]
                then
                        traceroute -q 1 -n $oneip | awk -F" " '{ if(NR!=1) print $2 }' > trace
                fi
                cat trace
                rm ip
                rm oneip
                rm trace_path
                rm trace
                rm nc_log
                break
       else
                sleep 0.1

                        if [ $i -eq 20 ]
                                then
                                        exit
                        fi
        fi
done
