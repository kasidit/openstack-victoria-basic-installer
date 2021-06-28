cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script with sudo or as root."
echo -n "1. set admin-openrc.sh "
source ./admin-openrc.sh
openstack token issue
