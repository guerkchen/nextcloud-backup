#/bin/bash

datetime=`date +"%F-%T"`
backup_name="backup-${datetime}-full"
tar --verbose --verbose --create --gzip --listed-incremental=backup/${backup_name}.sngz --file=backup/${backup_name}.tgz cloud
