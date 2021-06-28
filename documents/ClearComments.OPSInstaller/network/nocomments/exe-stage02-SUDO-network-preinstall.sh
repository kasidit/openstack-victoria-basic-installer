cd /home/openstack/OPSInstaller/network; pwd
printf "1. set interface/hosts files.. press any key\n"
cp files/interfaces /etc/network/interfaces
cp files/hosts /etc/hosts
printf "2. set ntp server.. press any key\n"
apt-get -y install chrony
cp files/chrony.conf /etc/chrony/chrony.conf
service chrony restart
printf "3. restart eth networking.. press\n"
ifdown ens4
ifup ens4
ifdown ens5
ifup ens5
ifdown ens6
ifup ens6
service networking restart
sleep 5
date
ifconfig
