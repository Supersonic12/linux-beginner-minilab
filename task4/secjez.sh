#!/bin/bash

current_perm=$(ls -l secjez.sh | awk '{print $1}' )
accptd_perm="-rwx---r--"
current_us_gr=$(ls -l secjez.sh | awk '{print $3":"$4}')
accptd_us_gr="$USER:$USER"
if [[ $current_perm == $accptd_perm && $current_us_gr == $accptd_us_gr ]];then
	echo -e "Nice, now find the flag file in task4/ \nRemember flag patterns in task2, task3."
	answer=$(ls -l secjez.sh | awk '{print $1}' | sha256sum | awk '{print $1}')
	echo "JESUS{$answer}" > jez1.gol
elif [[ $current_perm == $accptd_perm || $current_us_gr == $accptd_us_gr ]];then
       echo -e "Either permission aren't set right, or ownership, owner should be your current user, remember."	
else
	echo -e "Permissions set wrong, try changing them"	
fi
