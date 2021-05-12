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
printf "1. set br0 br-data and br-vlan\n"
sudo apt-get -y install bridge-utils 
sudo apt-get -y install openvswitch-switch 
#
# We assume for now that br-data br-vlan dataif and vlanif are created manually at the host
# The br-data and br-vlan must also be connected with appropriate physical interfaces
#
sudo ovs-vsctl add-br br-data 
sudo ovs-vsctl add-br br-vlan 
sudo ovs-vsctl add-port br-data vasabi-1234data_tunnel_Genericcompute1_node_ip_nic4321-ibasav -- set interface vasabi-1234data_tunnel_Genericcompute1_node_ip_nic4321-ibasav type=internal
sudo ovs-vsctl add-port br-vlan vasabi-1234vlan_Genericcompute1_node_ip_nic4321-ibasav -- set interface  vasabi-1234vlan_Genericcompute1_node_ip_nic4321-ibasav type=internal

printf "2. set interface/hosts files.. \n"
#read varkey
cp files/interfaces-vm-controller /etc/network/interfaces
cp files/hosts /etc/hosts
#
printf "3. reboot the compute node by yourselve\n"
#reboot
