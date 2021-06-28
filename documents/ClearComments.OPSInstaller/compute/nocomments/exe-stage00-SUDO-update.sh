cd /home/openstack/OPSInstaller/compute; pwd
cp files/hosts /etc/hosts
 
apt-get update
add-apt-repository cloud-archive:victoria
apt-get update 
apt-get -y dist-upgrade
apt-get -y install python3-openstackclient
apt-get -y install ifupdown net-tools
reboot
