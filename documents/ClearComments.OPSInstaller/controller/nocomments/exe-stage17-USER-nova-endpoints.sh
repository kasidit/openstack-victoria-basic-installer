cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script  as user."
echo -n "Create nova user and endpoint..."
source ./admin-openrc.sh
openstack user create --domain default --password NOVA_PASS nova
openstack role add --project service --user nova admin
openstack service create --name nova \
  --description "OpenStack Compute" compute
openstack endpoint create --region RegionOne \
  compute public http://controller:8774/v2.1/
openstack endpoint create --region RegionOne \
  compute internal http://controller:8774/v2.1/
openstack endpoint create --region RegionOne \
  compute admin http://controller:8774/v2.1/
