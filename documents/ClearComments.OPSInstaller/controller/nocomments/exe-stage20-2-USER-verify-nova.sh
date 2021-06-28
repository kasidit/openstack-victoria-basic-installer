cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
source ./admin-openrc.sh
openstack compute service list
openstack catalog list
openstack image list
sudo nova-status upgrade check
