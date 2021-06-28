cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a sudo user."
echo -n "1. create keystone database user..."
mysql -u root -pmysqlpassword -e "CREATE DATABASE keystone;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY 'KEYSTONE_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' IDENTIFIED BY 'KEYSTONE_DBPASS';"
