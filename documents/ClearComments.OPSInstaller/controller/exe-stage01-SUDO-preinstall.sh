# OpenStack Queens installation script on Ubuntu 16.04.4 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
#!/bin/bash -x
#
cd /home/openstack/OPSInstaller/controller; pwd
printf "1. inspect controller's  interface/hosts files..\n"
#read varkey

cat /etc/netplan/00-installer-config.yaml
cat /etc/hosts

printf "2. set ntp server usig chrony\n"
#read varkey
apt-get -y install chrony

cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart
#
