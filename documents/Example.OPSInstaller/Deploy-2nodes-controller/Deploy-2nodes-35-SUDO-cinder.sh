# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-2nodes-controller
pwd
echo "Run this script with sudo or as root."
echo -n "Install placement"

apt -y install cinder-api cinder-scheduler 

cp files/cinder.conf /etc/cinder/cinder.conf
cp files/nova-stage40.conf /etc/nova/nova.conf

echo "su -s /bin/sh -c \"cinder-manage db sync\" cinder"
su -s /bin/sh -c "cinder-manage db sync" cinder
#
service nova-api restart
service cinder-scheduler restart
#
service apache2 restart
#
