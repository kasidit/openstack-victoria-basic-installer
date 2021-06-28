# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x 
#
#
echo "copy OPSInstaller.tar file to home directory"
#
cp OPSInstaller.tar /home/openstack/
cd /home/openstack
tar xvf OPSInstaller.tar
