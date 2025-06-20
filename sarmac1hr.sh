#! /bin/zsh
#
# file : sarmac1hr.sh
#
# doc:
#   primitive alternative for macboo, to collect sar-data
#   this file is hardcoded for 1 hr, so crontab is:
#   min hr dom mon dow /fullpath/to/exec
#   0 * * * * /Users/pdvbv/data/pdvmoto/uxutil/sarmac1hr.sh
#
# other files :
#  - sar.sh : run manually..
#     dflt interval 60 sec ? 
#     dflt keeptime 20 or 30 days?
#
# todo: remove the SARFILE if older than 20days
#

# old format example
# N_USR=3.141529
# printf "%4.2f\n" $N_USR

IOSTAT=/usr/sbin/iostat 
SARFILE=~/var/log/sa/sa`date +"%d"`
INTERVAL_SEC=60
# NR_ITER=10
LOOP_TIME=600

# todo: remove the SARFILE if older than 20days

START_TIME_SEC=$(date +%s)

while [ $(($(date +%s) - ${START_TIME_SEC} )) -lt ${LOOP_TIME} ]
do 

  echo $0 running start loop interval $START_TIME_SEC $LOOP_TIME $INTERVAL_SEC $NR_ITER

  SAR=$( $IOSTAT -d -C $INTERVAL_SEC 2 | tail -n 1)
  # DT=${date +'%H:%M:%S'}

  echo " " `date +"%H:%M:%S"` "-" $SAR " " | tee -a $SARFILE

  # make sure we surpass the loop_time
  # sleep 2

done

