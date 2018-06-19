#!/bin/bash

# Makes a timestamp
timestamp() {
 echo $(date +%d)/$(date +%m)/$(date +%y) $(date +"%T")
}

#Continuously outputs timestamp, fan speed and cpu temperature
while true
do
	timestamp
	printf "$(sensors | grep "fan1\|temp1" | tail -n2) \n \n" | tee -a logfile &
	sleep 30 
done
