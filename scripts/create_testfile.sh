#/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters"
  exit 2	
fi


testdir=${1}
datetime=`date +"%F_%H-%M-%S"`
filename="datetest-${datetime}"

# delete old file
rm -f "${testdir}/${prefix}*"

# create new file
echo "${date}" > ${testdir}/$filename
