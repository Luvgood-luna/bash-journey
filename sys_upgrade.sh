#! /bin/bash

# script to update system packages
# Define the log file location
LOGFILE="/home/giyu/bashscripts/system_update.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S") 
echo "-----system update log ----------- " > $LOGFILE

#update the package list 
echo "[$TIMESTAMP] INFO: Updating package list...." | tee -a "$LOGFILE"
sudo apt update >> "$LOGFILE" 2>&1

# If exit code is 0 then display the success message
if [ $? -eq 0 ]; then
	echo "[$TIMESTAMP] INFO: Packages updated succesfully" | tee -a "$LOGFILE"
else
	echo "[$TIMESTAMP] ERROR: Failed to update packages" | tee -a "$LOGFILE"
fi

#upgrade the package list 
echo "[$TIMESTAMP] INFO: Upgrading package list...." | tee -a "$LOGFILE"
sudo apt upgrade >> "$LOGFILE" 2>&1 
if [ $? -eq 0 ]; then
	echo "[$TIMESTAMP] INFO: Packages upgrade succesfully" | tee -a "$LOGFILE"
else
	echo "[$TIMESTAMP] ERROR: Failed to upgrade packages" | tee -a "$LOGFILE"
fi


#clean unused depencies
echo "[$TIMESTAMP] INFO: Cleaning unused dependencies" | tee -a "$LOGFILE"
if [ $? -eq 0 ]; then
	echo "[$TIMESTAMP] INFO: removed unused dependencies" | tee -a "$LOGFILE"
else
	echo "[$TIMESTAMP] ERROR: removing dependecies failed" | tee -a "$LOGFILE"
fi

echo "[$TIMESTAMP] INFO: update completed at $(date)" >> "$LOGFILE"



