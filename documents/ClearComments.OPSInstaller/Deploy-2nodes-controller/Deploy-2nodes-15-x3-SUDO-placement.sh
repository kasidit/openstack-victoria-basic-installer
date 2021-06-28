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

apt -y install placement-api 

cp files/placement.conf /etc/placement/placement.conf

echo "su -s /bin/sh -c \"placement-manage db sync\" placement"
su -s /bin/sh -c "placement-manage db sync" placement
#
service apache2 restart
#
