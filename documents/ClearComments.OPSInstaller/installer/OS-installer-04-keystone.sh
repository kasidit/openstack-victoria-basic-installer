# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
# keystone
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage08-SUDO-keystone-database.sh | tee $HOME/log/s08-controller.log
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage09-SUDO-keystone.sh | tee $HOME/log/s09-controller.log
sleep 5
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage10-USER-service-endpoints.sh | tee $HOME/log/s10-controller.log
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage11-USER-test-envscript.sh | tee $HOME/log/s11-controller.log
printf "\nnext run ./OS-installer-05-glance.sh\n"
