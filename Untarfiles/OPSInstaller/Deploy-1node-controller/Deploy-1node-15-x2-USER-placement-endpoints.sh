# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-1node-controller
pwd
echo "Run this script as a user."
source ./admin-openrc.sh
#
openstack user create --domain default --password vasabilabPLACEMENT_PASS placement
#
openstack role add --project service --user placement admin
#
openstack service create --name placement \
  --description "Placement API" placement

openstack endpoint create --region RegionOne \
  placement public http://controller:8778
openstack endpoint create --region RegionOne \
  placement internal http://controller:8778
openstack endpoint create --region RegionOne \
  placement admin http://controller:8778
