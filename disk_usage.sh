#!/bin/bash
#SCRIPT TO ALERT IF DISK USAGE EXCEEDS
THRESHOLD=80
TIMESTAMP=$(date +"%Y-%m-%d %H-%M-%S")
USAGE=$( df / | awk 'NR==2 {print $5}' | sed 's/%//')

#check if the disk usage exceeds a threshold
if [ "$USAGE" -ge "$THRESHOLD" ]; then
	echo "[$TIMESTAMP] WARNING: Disk usage is at $USAGE \n exceeds threshold $THRESHOLD " 
else
	echo "[$TIMESTAMP] INFO: Disk usage within limit $USAGE"
fi
