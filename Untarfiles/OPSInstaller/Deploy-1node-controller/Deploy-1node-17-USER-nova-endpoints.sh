# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-1node-controller
pwd
echo "Run this script  as user."
echo -n "Create nova user and endpoint..."
#read varkey

source ./admin-openrc.sh

openstack user create --domain default --password vasabilabNOVA_PASS nova
openstack role add --project service --user nova admin
openstack service create --name nova \
  --description "OpenStack Compute" compute
openstack endpoint create --region RegionOne \
  compute public http://controller:8774/v2.1/
openstack endpoint create --region RegionOne \
  compute internal http://controller:8774/v2.1/
openstack endpoint create --region RegionOne \
  compute admin http://controller:8774/v2.1/
