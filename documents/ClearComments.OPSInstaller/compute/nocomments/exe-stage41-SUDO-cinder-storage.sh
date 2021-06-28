cd /home/openstack/OPSInstaller/compute; pwd
echo "Please modify this file to define devices...press anykey"
read keyvar;
apt -y install lvm2 thin-provisioning-tools
pvcreate /dev/sdb
pvcreate /dev/sdc
vgcreate cinder-volumes /dev/sdb
vgcreate cinder-volumes /dev/sdc
cp files/lvm.conf /etc/lvm/lvm.conf
apt -y install cinder-volume
cp files/cinder.conf /etc/cinder/cinder.conf
service tgt restart
service cinder-volume restart
