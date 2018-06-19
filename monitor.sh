#!/bin/bash
while true
do
	printf "$(date '+TIME:%H:%M:%S \n') $(sensors | grep "fan1\|temp1" | tail -n2) \n" | tee -a logfile
	sleep 5
done


# upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage"
#
#
