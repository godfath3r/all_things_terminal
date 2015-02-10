#!/bin/bash

old=`cat /tmp/ip`
current=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | grep IP | awk '{print $4}'`
if [ "$old" != "$current" ]; then
  echo $current > /tmp/ip
  notify-send "Your IP changed to:" $current
fi
