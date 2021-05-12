# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/Deploy-2nodes-controller
pwd
echo "Run this script as a user."
printf "\nCreate placement database tables...\n"
#read varkey
mysql -u root -pvasabilabMYSQL_PASS -e "CREATE DATABASE placement;"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON placement.* TO 'placement'@'localhost' IDENTIFIED BY 'vasabilabPLACEMENT_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON placement.* TO 'placement'@'%' IDENTIFIED BY 'vasabilabPLACEMENT_DBPASS';"
