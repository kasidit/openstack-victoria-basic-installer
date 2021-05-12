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
echo -n "1. set admin-openrc.sh "
source ./admin-openrc.sh

openstack token issue
