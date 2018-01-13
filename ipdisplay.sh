#!/bin/bash

host_name=`hostname`

#interface_name=`cat /proc/net/dev|tail -n +3|grep -v lo|awk -F: '{print $1}'`

while true;
do
#  ipaddress=`ifconfig $interface_name | grep -w "inet" | awk '{ print $2}'`
  ipaddress=`hostname -I`
  if [ "$ipaddress" ];then
    break
  else
    sleep 3
    continue
  fi
done

/home/pi/raspioled/oledi2c -f 2 -s -l 30 "Hostname: "$host_name" IP Address: "$ipaddress &
