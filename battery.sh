 #!/bin/bash

# Makes a timestamp so that the whole thing is coherent or something
timestamp() {
 echo -e "{\n\"time\":" \"$(date +"%T")\"
}
while true
do
    timestamp # >> `date +"%d-%m-%Y"`.log
        # First case, if the battery is present in the laptop
        if [[ $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "present") == *"yes" ]]
            then 
            
            echo -n '"percentage":' 
            upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {sub($2, "\"&\"") ; print ($2)}' # >> `date +"%d-%m-%Y"`.log 
		    echo -n '"state":'
            upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ {sub($2, "\"&\"") ;print ($2)}' # >> `date +"%d-%m-%Y"`.log
		    echo -e "}"
        sleep 30
    else
            echo -n '"state":'
            echo '"n/a"'
        sleep 30
    fi
done








# If battery present, outputs level and state (charging/discharging)
#if [[ $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "present") == *"yes" ]]
#then 
#    echo "Battery present, tracking started!"
#    while true
#    do
#        timestamp >> `date +"%d-%m-%Y"`.log
#		upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" >> `date +"%d-%m-%Y"`.log 
#		upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" >> `date +"%d-%m-%Y"`.log
#		sleep 30
#   done
# If battery is removed, keeps tracking anyways 
#else echo "Battery not present, tracking started!"
#    while true
#    do
#        timestamp >> `date +"%d-%m-%Y"`.log
#		echo "not present" >> `date +"%d-%m-%Y"`.log
#		sleep 30
#    done
#fi