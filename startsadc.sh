#!/bin/ksh

# 27-Jul-23, pdv: start sadc at whole 10min

# set -v -x

# -----------------

# if entrypoint or startup script is not root:
# chmod oracle:dba /var/log/sa
# chmod oracle:dba /var/log/sa/*
#
#
# Add this nohup somewhere in the start-sequence.. try starting sadc
# it will wait until nr of minutes/10, and start collecting
#
# nohup /opt/oracle/startsadc.sh & 
#
#
# ------------------

echo
echo ---- will try to start sar-collection at 10min, and run for 1 day. --- 
echo 
echo Needs package sysstat , can be found from yum or apt
echo
echo note:
echo 1. please run as root to ensure access tot /var/log/sa 
echo 2. verify path to sar, sadc, sa1 etc... and verify sa-files
echo 3. resulting run should be something like " /usr/lib64/sa/sadc -F -L -S DISK 600 30 - " 
echo 4. check nohup, which may or may not work.
echo
echo -- -- -- -- -- -- 
echo
echo
echo ---- waiting for 00 to start at 10min precise ------
echo

 while expr `date +%M` % 10  != 0 ; do echo `date`  ; sleep 10 ; done 

echo we got to 00, ready to start sadc..., try using sa1, 600=10min, and repeat forever..

/usr/lib64/sa/sa1 600 6000000

# may also need: /usr/lib64/sa/sadc -F -L -S DISK 600 30 - 

echo `date` started sadc, verify ps -ef 

echo
echo ----  end of startsadc.sh -------- 
echo
