#!/bin/bash
gw_ip=`ip r | grep default | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`
output=`timeout 8 curl -s ${gw_ip}`
connected=`echo "$output" | grep "simple-desc" | grep -c "PPP connected"`
speeds=`echo "$output" | grep Broadband_Status_Id -A1 | grep -P "\\d+\.?\\d+" -o `
set -o noglob         # Do not expand special characters such as *, ? etc.
IFS=$'\n' up_down=($speeds)
set +o noglob 
uplink=${up_down[0]}
downlink=${up_down[1]}

if [[ $connected -eq 1 ]]; then
    echo "Connected: $connected"
    echo "Up speed: $uplink Mbps"
    echo "Dn speed: $downlink Mbps"
else
    echo "Not connected or timeout."
fi
