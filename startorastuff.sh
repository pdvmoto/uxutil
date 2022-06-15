#!/usr/bin/ksh

export ORAENV_ASK=NO
export ORACLE_SID=ORCLCDB

. oraenv 

lsnrctl start 

sqlplus /nolog <<EOF

connect / as sysdba 
startup

EOF

echo .
echo check if lsnr and db started...
echo .
echo use this script to start oracle stuff, usually from /usr/local/sbin.
echo .

