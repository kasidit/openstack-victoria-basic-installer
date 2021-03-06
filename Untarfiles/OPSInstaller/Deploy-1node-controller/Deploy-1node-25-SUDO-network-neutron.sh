# OpenStack Queens installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-1node-controller
pwd

printf "* install neutron packages.. \n"
#read varkey
apt-get -y install neutron-plugin-ml2 neutron-l3-agent 
apt-get -y install neutron-openvswitch-agent openvswitch-switch
apt-get -y install neutron-dhcp-agent neutron-metadata-agent

printf "* copy config files.. \n"
#read varkey

#cp files/neutron.conf /etc/neutron/neutron.conf
#cp files/ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
cp files/network-node-metadata_agent.ini /etc/neutron/metadata_agent.ini
