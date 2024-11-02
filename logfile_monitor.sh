#!/bin/bash

# Configuration
LOG_FILE="/home/giyu/bashscripts/system_update.log"  # Path to the log file
KEYWORD="ERROR"                        # Keyword to monitor
EMAIL="recipient@example.com"           # Email to notify

# Function to send email notification
send_email() {
    local message="$1"
    echo "$message" | mail -s "Log Alert: $KEYWORD found" "$EMAIL"
}

# Monitor log file for keyword
tail -F "$LOG_FILE" | while read line; do
    echo "$line" | grep "$KEYWORD" &>/dev/null
    if [ $? -eq 0 ]; then
        # Print to terminal
        echo "Notification: $line"
        # Send email notification
        #send_email "$line"
    fi
done
