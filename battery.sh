#!/bin/bash

# Makes a timestamp
timestamp() {
 echo $(date +%d)/$(date +%m)/$(date +%y) $(date +"%T")
}

# If battery present, outputs level and state (charging/discharging)
if [[ $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "present") == *"yes" ]]
then 
    echo "Battery tracking started!"
    while true
    do
        timestamp >> `date +"%d-%m-%Y"`.log
		upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" >> `date +"%d-%m-%Y"`.log 
		upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" >> `date +"%d-%m-%Y"`.log
		sleep 30
    done
else echo "Battery not present"
fi