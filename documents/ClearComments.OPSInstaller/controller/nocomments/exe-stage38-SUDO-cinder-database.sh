cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
printf "\nCreate cinder database tables...\n"
mysql -u root -pmysqlpassword -e "CREATE DATABASE cinder;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'localhost' IDENTIFIED BY 'CINDER_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'%' IDENTIFIED BY 'CINDER_DBPASS';"
