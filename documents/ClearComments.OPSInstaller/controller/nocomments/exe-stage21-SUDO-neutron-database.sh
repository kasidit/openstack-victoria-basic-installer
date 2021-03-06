cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
printf "\nCreate neutron database...\n"
mysql -u root -pmysqlpassword -e "CREATE DATABASE neutron;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' IDENTIFIED BY 'NEUTRON_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' IDENTIFIED BY 'NEUTRON_DBPASS';"
