#!/bin/bash

last_full_backup_file=$(ls backup/backup-*-full.tgz | sort | tail -n1)

last_full_backup=$(date -d ${last_full_backup_file:14:10} +%s)

echo "Last full Backup was done on ${last_full_backup:14:10}"
full_deadline=$(date -d '7 days ago' +%s)
if (($last_full_backup < $full_deadline)); then
  echo "create new full backup"
  ./scripts/full_backup.sh
else
  echo "create incremental backup"
  ./scripts/incr_backup.sh
fi
