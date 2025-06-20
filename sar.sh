#! /bin/zsh

# doc:
# if no interval given: cat the available sar file, if any
# if interval given: run sar with that interval (generally a small value)
#
# other files :
#  - sadc_mac.sh : collect the sarfile, possibly use cron
#     dflt interval 60 sec ? 
#     dflt keeptime 20 or 30 days?
#
# install, links as root:
#   ln -s /Users/pdvbv/data/pdvmoto/uxutil/sar.sh /usr/local/bin/sar 
#   


# N_USR=3.141529
# printf "%4.2f\n" $N_USR

# use $1 for seconds interval, dflt=5

SARFILE=~/var/log/sa/sa`date +"%d"`

# todo: remove the SARFILE if older than 20days

if [ -n "$1" ]; then
 
  echo numeric interval paramter, use as interval

  # use arg1 as interval
  INTERVAL_SEC=${1}

  echo should do inteval of $INTERVAL_SEC

  while true 
  do 

    SAR=$(iostat -d -C $INTERVAL_SEC 2 | tail -n 1)
    # DT=${date +'%H:%M:%S'}

    echo " " `date +"%H:%M:%S"` "-" $SAR " "

    # if there is no cron or sysstat deamon to save the data, tee it to file
    # echo " " `date +"%H:%M:%S"` "-" $SAR " " | tee -a $SARFILE

  done

else 

  # cat fil
  echo no inteval given, try cat $SARFILE
  cat  $SARFILE 

fi

