#!/bin/bash

# Define the threshold percentage (80% in this case)
THRESHOLD=80

# Get the disk usage percentage for the root partition ("/"). You can change the partition if needed.
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if the disk usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  # Trigger an alert (you can modify this part to send an email or log to a file)
  echo "Disk utilization is above ${THRESHOLD}% (Current usage: ${USAGE}%)"
  
  # Example of sending an email alert (requires mail command setup)
  # echo "Disk utilization is above ${THRESHOLD}% (Current usage: ${USAGE}%)" | mail -s "Disk Usage Alert" your-email@example.com

  # You can also log this to a file
  echo "$(date) - ALERT: Disk usage is ${USAGE}% on root partition" >> /var/log/disk_usage_alert.log
else
  # If disk usage is within the threshold, you can log the status
  echo "$(date) - Disk usage is fine: ${USAGE}%" >> /var/log/disk_usage_status.log
fi
