cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
printf "\nCreate neutron endpoints...\n"
source ./admin-openrc.sh
openstack user create --domain default --password NEUTRON_PASS neutron
openstack role add --project service --user neutron admin
openstack service create --name neutron \
  --description "OpenStack Networking" network
openstack endpoint create --region RegionOne \
  network public http://controller:9696
openstack endpoint create --region RegionOne \
  network internal http://controller:9696
openstack endpoint create --region RegionOne \
  network admin http://controller:9696
