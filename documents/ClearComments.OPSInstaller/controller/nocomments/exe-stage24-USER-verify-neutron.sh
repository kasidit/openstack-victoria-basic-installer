cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
echo -n "Verify neutron"
source ./admin-openrc.sh
openstack extension list --network
