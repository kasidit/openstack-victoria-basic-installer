# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd /home/openstack/OPSInstaller/compute1; pwd
printf "\nRun as root\n1. install nova.. press\n"
#read varkey
apt-get -y install nova-compute

