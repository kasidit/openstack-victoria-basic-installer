# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-2nodes-compute
pwd
printf "\nRun as root\n1. run dpkg .. press\n"
read varkey
dpkg -i --force-overwrite /var/cache/apt/archives/python3-cinderclient_1%3a5.0.0-0ubuntu2~cloud0_all.deb
echo -n "fix broken press any key"
read varkey
apt -y --fix-broken install
echo -n "reinstall nova-compute press any key"
read;
apt-get -y install nova-compute
echo -n "re dpkg press any key"
read varkey
dpkg -i --force-overwrite /var/cache/apt/archives/python3-cinderclient_1%3a5.0.0-0ubuntu2~cloud0_all.deb

cp files/nova.conf /etc/nova/nova.conf
cp files/nova-compute.conf /etc/nova/nova-compute.conf

service nova-compute restart

echo "DO NOT FORGET TO RUN HOST CELL PLACEMENT DISCOVERY COMMANDS ON THE CONTROLLER!"
