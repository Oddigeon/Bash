#!/bin/bash

export hostname=$(hostname)
export timezone=`cat /etc/timezone`
export user=`whoami`
export os=`hostnamectl | grep 'Operating System' | awk '{print $3,$4,$5}'`
export date=`date "+%d %b %Y %H:%M:%S"`
export uptime=$(uptime -p)
export uptime_sec=$(cat /proc/uptime | awk '{print $1}')
export ip=`ip -br a show lo | awk '{printf $3}'`
export mask=`ifconfig lo | grep netmask | awk '{print$4}'`
export gateway=`ip r | grep default | awk '{print$3}'`
export ram_total=`cat /proc/meminfo | head -n 1 | awk '{printf "%.3f", $2 / 1024 / 1024}'`
export ram_free=`cat /proc/meminfo | grep "MemFree" | awk '{printf"%.3f", $2 / 1024 /1024}'`
export space_root=`df -k / | tail -1 | awk '{printf"%.3f", $2 / 1024}'`
export space_root_used=`df -k / | tail -1 | awk '{printf"%.3f", $3 / 1024}'`
export space_root_free=`df -k / | tail -1 | awk '{printf"%.3f", $4 / 1024}'`
