cd /home/openstack/OPSInstaller/controller; pwd
printf "1. inspect controller's  interface/hosts files..\n"
cat /etc/netplan/00-installer-config.yaml
cat /etc/hosts
printf "2. set ntp server usig chrony\n"
apt-get -y install chrony
cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart
