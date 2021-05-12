# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/newcompute
pwd
printf "1. add physical interfaces to br-data and br-vlan\n"
#read varkey
ifup vasabi-1234GenericPhysical_data_tunnel_nic4321-ibasav
ifup vasabi-1234GenericPhysical_vlan_nic4321-ibasav
#
ovs-vsctl add-port br-data vasabi-1234GenericPhysical_data_tunnel_nic4321-ibasav
ovs-vsctl add-port br-vlan vasabi-1234GenericPhysical_vlan_nic4321-ibasav

printf "2. set ntp server.. press\n"
#read varkey
apt-get -y install chrony
cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart
#
ifconfig
