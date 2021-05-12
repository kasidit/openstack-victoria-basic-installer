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
echo -n "Install glance... Wait and see if there is a BUG! and apply fix in the script manually"

apt-get -y install glance 
