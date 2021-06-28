cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
source ./admin-openrc.sh
openstack extension list --network
openstack compute service list
openstack network agent list
