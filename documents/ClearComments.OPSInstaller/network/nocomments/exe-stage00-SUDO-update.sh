cd /home/openstack/OPSInstaller/network; pwd
cp files/hosts /etc/hosts
 
apt-get update
add-apt-repository cloud-archive:victoria
apt-get update 
apt-get -y dist-upgrade
apt-get -y install python3-openstackclient
apt -y install ifupdown net-tools
reboot
