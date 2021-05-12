# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd /home/vasabi-1234loginname4321-ibasav/OPSInstaller/controller; pwd
echo "Run this script as a user."
echo -n "Verify nova"

source ./admin-openrc.sh

openstack compute service list --service nova-compute
sudo su -s /bin/sh -c "nova-manage cell_v2 discover_hosts --verbose" nova

openstack compute service list --service nova-compute
