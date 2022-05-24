#!/bin/bash

# Find last full backup
last_full_backup=$(ls backup/backup-*-full.sngz | sort | tail -n1)
datetime=`date +"%F-%T"`
backup_name="backup-${datetime}-incremental.tgz"
tar --verbose --create --gzip --listed-incremental=$last_full_backup --file=backup/$backup_name cloud
