# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
mkdir $HOME/log
#
intype=vasabi-1234install_type4321-ibasav
full=full
#
# node setups
echo | ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/exe-stage00-SUDO-update.sh | tee $HOME/log/s00-network.log
echo | ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage00-SUDO-update.sh | tee $HOME/log/s00-compute.log
if [ "$intype" == "$full" ]
then
echo | ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage00-SUDO-update.sh | tee $HOME/log/s00-compute.log
fi
echo | ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage00-SUDO-update.sh | tee $HOME/log/s00-controller.log
printf "\n\nThis step reboots every node! Now, this node (the controller) will be rebooted. Wait until all rebooted nodes resume and proceed to run ./OS-installer-01-node-setup.sh... \n"
sudo reboot
