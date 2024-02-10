#!/usr/bin/ksh
#
# startsardock.sh : run sar in a docker contaner
#
# notes
# 1, script to (re)start sar data collection when no crontab or system is available.
# primitive: restart every 10 min to make sure output file is named correctly.
#
# 2. add to container-entry, e.g. to /op/oracle/runOracle.sh or other entrypoint
# 
# 2.a: get scripts: git clone  https://github.com/pdvmoto/uxutil
# 2.b: install sar if needed yum install sysstat, verify.
# 2.c: add to entrypoint:
# pdv: add running of sar, optional: check files present
# echo starting sar if possible
# nohup /opt/div/uxutil/startsardock.sh  &
# echo started sar if possible > /tmp/sarstart.log
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
