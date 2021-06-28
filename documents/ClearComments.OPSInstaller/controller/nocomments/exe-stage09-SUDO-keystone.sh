cd /home/openstack/OPSInstaller/controller; pwd
apt-get -y install keystone 
cp files/keystone.conf /etc/keystone/keystone.conf
echo "su -s /bin/sh -c \"keystone-manage db_sync\" keystone"
su -s /bin/sh -c "keystone-manage db_sync" keystone
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
keystone-manage bootstrap --bootstrap-password adminpassword \
--bootstrap-admin-url http://controller:5000/v3/ \
--bootstrap-internal-url http://controller:5000/v3/ \
--bootstrap-public-url http://controller:5000/v3/ \
--bootstrap-region-id RegionOne
cp files/apache2.conf /etc/apache2/apache2.conf
service apache2 restart
