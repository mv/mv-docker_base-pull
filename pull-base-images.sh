#!/bin/bash
#
# pull-base-images.sh
#
# ferreira.mv[ at ]gmail.com
# 2018-12
#

list="images.list.txt"

egrep -v '^#|^$' ${list} \
  | awk '{print "docker pull", $1 ":" $2 }' \
  | while read cmd
    do
      echo "=== cmd: ${cmd}"
      ${cmd}
      echo
    done

echo "Done."
echo

