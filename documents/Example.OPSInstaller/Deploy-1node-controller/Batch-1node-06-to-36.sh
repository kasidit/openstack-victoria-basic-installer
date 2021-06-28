#!/bin/bash

echo "Step 06-07 rabbit.. press"
read keyvars; 
sudo ./Deploy-1node-06-SUDO-compute-mysql.sh
sudo ./Deploy-1node-07-SUDO-rabbit.sh
echo "Step 08-11 keystone.. press"
read keyvars; 
sudo ./Deploy-1node-08-SUDO-keystone-database.sh
sudo ./Deploy-1node-09-SUDO-keystone.sh
sleep 1
./Deploy-1node-10-USER-service-endpoints.sh
./Deploy-1node-11-USER-test-envscript.sh
echo "Step 12-15 glance.. press"
read keyvars; 
sudo ./Deploy-1node-12-SUDO-glance-database.sh
./Deploy-1node-13-USER-glance-endpoints.sh
sleep 1
sudo ./Deploy-1node-14-SUDO-glance.sh 
sudo ./Deploy-1node-14-x1-SUDO-glance.sh
./Deploy-1node-15-USER-verify-glance.sh
echo "Step 15x1-x3 placement.. press"
read keyvars; 
sudo ./Deploy-1node-15-x1-SUDO-placement-database.sh
./Deploy-1node-15-x2-USER-placement-endpoints.sh
sudo ./Deploy-1node-15-x3-SUDO-placement.sh
echo "Step 16-20 nova.. press"
read keyvars; 
sudo ./Deploy-1node-16-SUDO-nova-database.sh
./Deploy-1node-17-USER-nova-endpoints.sh
sudo ./Deploy-1node-18-SUDO-nova.sh
sleep 1
sudo ./Deploy-1node-19-SUDO-nova-compute.sh
sudo ./Deploy-1node-19-x1-SUDO-nova-compute.sh
sleep 1
./Deploy-1node-20-0-USER-verify-nova-compute.sh
./Deploy-1node-20-1-USER-verify-nova-compute1.sh
./Deploy-1node-20-2-USER-verify-nova.sh
echo "Step 21-31 neutron.. press"
read keyvars; 
sudo ./Deploy-1node-21-SUDO-neutron-database.sh
./Deploy-1node-22-USER-neutron-endpoints.sh
sudo ./Deploy-1node-23-SUDO-neutron.sh
sleep 1
./Deploy-1node-24-USER-verify-neutron.sh
sudo ./Deploy-1node-25-SUDO-network-neutron.sh
sleep 1
sudo ./Deploy-1node-26-SUDO-reconfig-neutron-nova.sh
sleep 1
sudo ./Deploy-1node-27-SUDO-ovs-service.sh
./Deploy-1node-28-USER-verify-neutron2.sh
sudo ./Deploy-1node-29-SUDO-compute-neutron.sh
sleep 1
./Deploy-1node-30-USER-verify-neutron3.sh
./Deploy-1node-31-USER-initial-network.sh
echo "Step 32 horizon.. press"
read keyvars; 
sudo ./Deploy-1node-32-SUDO-horizon.sh
echo "Step 33-36 cinder.. press"
read keyvars; 
sudo ./Deploy-1node-33-SUDO-cinder-database.sh
./Deploy-1node-34-USER-cinder-endpoints.sh
sleep 1
sudo ./Deploy-1node-35-SUDO-cinder.sh
sudo ./Deploy-1node-36-SUDO-cinder.sh
echo "Done.. press"
read keyvars; 

