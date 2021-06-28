cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script with sudo or as root."
cp files/neutron_stage31.conf /etc/neutron/neutron.conf
service neutron-server restart
