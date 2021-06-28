cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
echo -n "Verify nova"
source ./admin-openrc.sh
openstack compute service list --service nova-compute
sudo su -s /bin/sh -c "nova-manage cell_v2 discover_hosts --verbose" nova
openstack compute service list --service nova-compute
