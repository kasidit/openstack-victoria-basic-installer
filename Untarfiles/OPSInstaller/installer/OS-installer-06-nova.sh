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
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage15-x1-SUDO-placement-database.sh | tee $HOME/log/s15-x1-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage15-x2-USER-placement-endpoints.sh | tee $HOME/log/s15-x2-controller.log
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage15-x3-SUDO-placement.sh | tee $HOME/log/s15-x3-controller.log
#
# nova
#
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage16-SUDO-nova-database.sh | tee $HOME/log/s16-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage17-USER-nova-endpoints.sh | tee $HOME/log/s17-controller.log
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage18-SUDO-nova.sh | tee $HOME/log/s18-controller.log
sleep 5
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage19-SUDO-nova-compute.sh | tee $HOME/log/s19-compute.log
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/exe-stage19-x1-SUDO-nova-compute.sh | tee $HOME/log/s19-compute.log
sleep 5
if [ "$intype" == "$full" ]
then
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage19-SUDO-nova-compute.sh | tee $HOME/log/s19-compute.log
ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/exe-stage19-x1-SUDO-nova-compute.sh | tee $HOME/log/s19-compute.log
fi
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage20-0-USER-verify-nova-compute.sh | tee $HOME/log/s20-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage20-1-USER-verify-nova-compute1.sh | tee $HOME/log/s20-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage20-2-USER-verify-nova.sh | tee $HOME/log/s20-controller.log
printf "\nnext run ./OS-installer-07-neutron.sh\n"
