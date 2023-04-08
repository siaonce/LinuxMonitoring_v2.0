#!/bin/bash

if [[ -f log.txt ]]; then
rm -f log.txt
fi
chmod +x *.sh

. ./files.sh
. ./test.sh


sudo bash -c "touch log.txt"
check $1 $2 $3 $4 $5 $6
start_create

if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo bash -c "apt install tree -y"
else
  tree $1 --du --si --dirsfirst 2>/dev/null
fi