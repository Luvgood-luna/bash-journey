#! /bin/bash

# script to monitor cpu and memory
#varibles
LOGFILE="/home/giyu/bashscripts/monitor.log" 
END=$((SECONDS+3600)) 

printf "MEMORY\t\tCPU\n" > "$LOGFILE"
#now monitor the cpu and memory
while [ $SECONDS -lt $END ]; do
	MEMORY=$(free -h | awk 'NR==2{printf "%.2f%\t\t", $3*100/$2}')
	CPU=$(top -bn1 | grep load | awk '{printf "%.2f%\n", $(NF-2) }')
	echo "$MEMORY$CPU" >> "$LOGFILE"
	sleep 5
done
