#!/bin/bash

# Get the current date and time
date_time=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a new log file with the current date and time
log_file="/var/log/gzbackup/backup_${date_time}.log"

## Version=1.1


### Script to backup save files over to a google cloud drive. 

if command -v rclone >/dev/null && command -v ludusavi >/dev/null; then 
  echo "[${date_time}] Starting backup process..." >> $log_file

  echo "Peforming game save file backup, please check $log_file for more information." 
  {
  echo "Displaying backup preview"
  ludusavi backup --preview
  echo "Starting backup process"
  ludusavi backup --compression zstd --force --format zip
  } >> $log_file

  echo "[${date_time}] OK: Backup complete"
else
  echo "ERRNOK: rclone or Ludusavi are not installed."
fi
