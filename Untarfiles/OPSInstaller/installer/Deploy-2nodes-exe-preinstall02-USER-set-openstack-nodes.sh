#!/bin/bash -x 
#
# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#
intype=vasabi-1234install_type4321-ibasav
full=full
#
pwd

echo "copy installer to nodes.. press"
#read varkey
scp OPSInstaller.tar openstack@controller:/home/openstack/OPSInstaller.tar
scp OPSInstaller.tar openstack@compute:/home/openstack/OPSInstaller.tar
#
echo "remove existing OPSInstaller on controller node"
#read varkey
ssh openstack@controller rm -rf /home/openstack/OPSInstaller 
echo "remove existing OPSInstaller on compute node"
#read varkey
ssh openstack@compute rm -rf /home/openstack/OPSInstaller 
#

echo "extract installer files on controller.. press"
#read varkey
ssh openstack@controller tar xvf /home/openstack/OPSInstaller.tar 
echo "extract installer files on compute node.. press"
#read varkey
ssh openstack@compute tar xvf /home/openstack/OPSInstaller.tar 
#ssh openstack@compute /home/openstack/OPSInstaller/remove-all-except-compute.sh
