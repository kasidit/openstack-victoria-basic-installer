# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd /home/vasabi-1234loginname4321-ibasav/OPSInstaller/compute; pwd
echo "Please modify this file to define devices...press anykey"
read keyvar;

apt -y install lvm2 thin-provisioning-tools

pvcreate /dev/sdb
pvcreate /dev/sdc
#
vgcreate cinder-volumes /dev/sdb
vgcreate cinder-volumes /dev/sdc

cp files/lvm.conf /etc/lvm/lvm.conf

apt -y install cinder-volume

cp files/cinder.conf /etc/cinder/cinder.conf

service tgt restart
service cinder-volume restart
