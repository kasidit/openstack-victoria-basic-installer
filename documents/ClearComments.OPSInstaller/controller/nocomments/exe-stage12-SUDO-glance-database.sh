cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
printf "\nCreate glance database tables...\n"
mysql -u root -pmysqlpassword -e "CREATE DATABASE glance;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' IDENTIFIED BY 'GLANCE_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' IDENTIFIED BY 'GLANCE_DBPASS';"
