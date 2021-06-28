cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script with sudo or as root."
echo -n "Install glance... again"
cp files/glance-api.conf /etc/glance/glance-api.conf
echo "su -s /bin/sh -c \"glance-manage db_sync\" glance"
su -s /bin/sh -c "glance-manage db_sync" glance
service glance-api restart
