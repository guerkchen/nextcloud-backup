#!/bin/bash

full_backup_count=$(ls backup/backup-*-full.sngz | sort | wc -l)
if [ $full_backup_count > 2 ]; then
  # we only want to keep two full backups, so we search for the second most recent and delete all files, which are older then this one.
  last_valid_backup_file=$(ls backup/backup-*-full.sngz | sort | tail -2 | head -1)
  last_valid_backup=$(busybox date -D "%F_%H-%M-%S" -d ${last_valid_backup_file:14:19} +%s)
  # iterate over all files and delete the old ones
  for filename in backup/*; do
    filename_date=$(busybox date -D "%F_%H-%M-%S" -d ${filename:14:19} +%s)
    if (($last_valid_backup > $filename_date)); then
      echo "i would delete $filename"
    fi
  done   
fi
