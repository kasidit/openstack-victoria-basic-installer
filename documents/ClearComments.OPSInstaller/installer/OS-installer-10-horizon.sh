# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
# horizon
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/exe-stage37-SUDO-horizon.sh | tee $HOME/log/s37-controller.log
printf "\n./OS-installer-11-cinder.sh\n"
