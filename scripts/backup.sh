#!/bin/bash

last_full_backup_file=$(ls backup/backup-*-full.tgz | sort | tail -n1)

# we ignore the exact time, since we don't want to miss a full backup by 2 minutes
# here we want a backup after 7 roughly days
last_full_backup=$(busybox date -D "%F" -d ${last_full_backup_file:14:10} +%s)

echo "Last full Backup was done on ${last_full_backup:14:19}"
full_deadline=$(date -d '7 days ago' +%s)
if (($last_full_backup < $full_deadline)); then
  echo "create new full backup"
  ./scripts/full_backup.sh
else
  echo "create incremental backup"
  ./scripts/incr_backup.sh
fi
