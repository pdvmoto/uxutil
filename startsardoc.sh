#!/usr/bin/ksh
#
# startsardock.sh : run sar in a docker contaner
#
# notes
# script to (re)start sar data collection when no crontab or system is available.
# primitive: restart every 10 min to make sure output file is named correctly.
#
#
SARDIR=/var/log/sa/
cd $SARDIR
#
# restart every 10min to ensure output-name
#
while true
do

# output file with dd in name
  SAROUT=/var/log/sa/sa`date +%d` 
  # 
  nohup sar -o $SAROUT 60 10 &

  sleep 600
done
