#!/bin/bash
# Simple script, it can be run with cron to notify you through notify-send
# that your internet ip has changed

# set recepient variable in order to get notified by mail
# you must first configure mailx.
# recipient='test_mail@host.com'

old=`cat /tmp/ip`
current=`curl -s http://checkip.dyndns.org:8245 | grep -Po '(\d{1,3}\.?){4}'`
if [ "$old" != "$current" ]; then
  echo $current > /tmp/ip
  notify-send "Your IP changed to:" $current
  if [ $recipient ]; then
    echo "My new ip now is: " $current | mailx -v -s "IP change" $recipient
  fi
fi
