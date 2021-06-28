# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd /home/openstack/OPSInstaller/compute1; pwd

cp files/nova.conf /etc/nova/nova.conf
cp files/nova-compute.conf /etc/nova/nova-compute.conf

service nova-compute restart

echo "DO NOT FORGET TO RUN HOST CELL PLACEMENT DISCOVERY COMMANDS ON THE CONTROLLER!"
