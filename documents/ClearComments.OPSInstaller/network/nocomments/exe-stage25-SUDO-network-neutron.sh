cd /home/openstack/OPSInstaller/network; pwd
printf "* install neutron packages.. \n"
apt-get -y install neutron-plugin-ml2 neutron-l3-agent 
apt-get -y install neutron-openvswitch-agent openvswitch-switch
apt-get -y install neutron-dhcp-agent neutron-metadata-agent
printf "* copy config files.. \n"
cp files/neutron.conf /etc/neutron/neutron.conf
cp files/ml2_conf.ini /etc/neutron/plugins/ml2/ml2_conf.ini
cp files/metadata_agent.ini /etc/neutron/metadata_agent.ini
cp files/dhcp_agent.ini /etc/neutron/dhcp_agent.ini
