# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
#
intype=vasabi-1234install_type4321-ibasav
full=full
#
# placement 
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage38-SUDO-cinder-database.sh | tee $HOME/log/s38-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage39-USER-cinder-endpoints.sh | tee $HOME/log/s39-controller.log
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage40-SUDO-cinder.sh | tee $HOME/log/s40-controller.log
sleep 5
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage41-SUDO-cinder-storage.sh | tee $HOME/log/s41-compute.log
printf "\nThat's it for now\n"
