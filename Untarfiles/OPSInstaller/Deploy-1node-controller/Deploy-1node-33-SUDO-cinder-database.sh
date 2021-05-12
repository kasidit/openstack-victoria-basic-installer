# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-1node-controller
pwd
echo "Run this script as a user."
printf "\nCreate cinder database tables...\n"
#read varkey
mysql -u root -pmysqlpassword -e "CREATE DATABASE cinder;"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'localhost' IDENTIFIED BY 'vasabilabCINDER_DBPASS';"
mysql -u root -pmysqlpassword -e "GRANT ALL PRIVILEGES ON cinder.* TO 'cinder'@'%' IDENTIFIED BY 'vasabilabCINDER_DBPASS';"
