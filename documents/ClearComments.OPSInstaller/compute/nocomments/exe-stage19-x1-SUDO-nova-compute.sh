cd /home/openstack/OPSInstaller/compute; pwd
cp files/nova.conf /etc/nova/nova.conf
cp files/nova-compute.conf /etc/nova/nova-compute.conf
service nova-compute restart
echo "DO NOT FORGET TO RUN HOST CELL PLACEMENT DISCOVERY COMMANDS ON THE CONTROLLER!"
