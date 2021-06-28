cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
printf "\nCreate placement database tables...\n"
mysql -u root -pmysqlpassword -e "CREATE DATABASE placement;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON placement.* TO 'placement'@'localhost' IDENTIFIED BY 'PLACEMENT_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON placement.* TO 'placement'@'%' IDENTIFIED BY 'PLACEMENT_DBPASS';"
