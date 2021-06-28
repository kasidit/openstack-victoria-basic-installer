# OpenStack Queens installation script on Ubuntu 16.04.4 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
# Run this with sudo or as root

#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-2nodes-controller
pwd
echo "check chrony"
chronyc sources
sleep 1
#
apt-get -y install software-properties-common
apt update ; apt upgrade -y; apt clean ; apt autoremove -y
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"
apt-get -y install mariadb-server
apt-get -y install python-pymysql
#
printf "* set openstack.cnf configuration... \n" 
sleep 2
#read varkey
cp files/99-openstack.cnf /etc/mysql/mariadb.conf.d/99-openstack.cnf

service mysql restart

printf "\n *** First, enter blank for mysql password. Then set new password to\n        mysqlpassword \n*** \n" 
sleep 2
mysql_secure_installation
systemctl status mysql
