# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
nettype=classic_ovs
dvr=dvr_ovs
#
# initial user network
if [ "$nettype" == "$dvr" ]
then
ssh -t openstack@controller /bin/bash -x ./OPSInstaller/controller/exe-stage36-USER-initial-network.sh | tee $HOME/log/s36-controller.log
fi
printf "\nNext ./OS-installer-10-horizon.sh\n"
