#!/bin/bash

status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')
connected=$(bluetoothctl info | grep "Connected: yes")
connected_list=$(bluetoothctl info | grep Name | cut -d' ' -f2-)

if [[ "$status" == "yes" ]]; then
    if [[ -n "$connected" ]]; then
      echo '{"text":"<span></span> '"$connected_list"'","tooltip":"Bluetooth device(s) connected: '"$connected_list"'","class":"connected"}'
    else
        echo '{"text":"<span></span>","tooltip":"Bluetooth on, no device connected","class":"on"}'
    fi
else
    echo '{"text":"<span></span>","tooltip":"Bluetooth off","class":"off"}'
fi

