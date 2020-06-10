#!/bin/bash


# template for tunneling..
#
# set range and purpose on top of file
# range: 9100 
# client: whoever.
#
#
# ports for caliber: 9100.. 9199
#  9101 = playground, vmora01: ORCL
#  9102 = dev, hoster..
#  9103 =  test
#  9104 =  cala
#  910X = 
#  9108 = ip:port awsvmdev11caliber.global, Shrenik
#  9109 = 54.194.211.79 awsvmora01, Shrenik
#  9110 = 54.194.211.79 awsvmora01, Shrenik
#

# tunnellig via ssh wil start with
# ssh -N user@authorizinghost \
#
# put lines down for copy/paste
# -L 9101:hostname or ip:1521 \
# -L 9102:hostname or ip:1521 \
# etc..

echo -- 
echo -- setting tunnels for PB at `date`
echo -- 

# audio notification is useful for when tunnels break.
say Starting Tunnels to customer via host dot domain dot com 

# make tunnels visible, always instructive
set -v 

ssh -N piet@host.domain.com \
-L 9101:dbhost.domain.com:1521 


set +v

# audio notification is useful for when tunnels break.
say Network Alert.
say tunnels for customer have stopped.
echo --
echo -- tunnels for Caliber stopped at `date` 
echo -- 

