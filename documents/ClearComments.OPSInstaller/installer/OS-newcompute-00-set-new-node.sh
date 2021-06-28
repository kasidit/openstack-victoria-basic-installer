# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
if [ $# -ne 11 ]
then
  echo "./OS-newcompute-00-set-new-node.sh <newHostname> <newMaageIPNic> <newHostManagementIP> <ManagePhysicalNic> <newDataIpNic> <newHostDataTunnelIP> <dataPhysicalNIC> <newVlanNic> <vlanPhysicalNic> <newExtNic> <controllerIP>"
  echo "  The script will remove any existing mapping of the <newHostManagementIP> in the /etc/hosts file" 
  echo "  and then insert a new mapping of <newHostManagementIP> and <newHostname> in there."
  echo "  This script assumes that the same hostname and IP addressed are already defined at the destination."
  exit 1
fi
#
newHostname=${1}
newHostManagementIPNic=${2}
newHostManagementIP=${3}
newHostManagementPhysicalNic=${4}
newHostDataTunnelIPNic=${5}
newHostDataTunnelIP=${6}
newHostDataTunnelPhysicalNic=${7}
newHostVlanIPNic=${8}
newHostVlanPhysicalNic=${9}
newHostExternalIPNic=${10}
ControllerIP=${11}
#
sudo sed -i "/${newHostManagementIP}/d" /etc/hosts
sudo sed -i "/${ControllerIP}/a ${newHostManagementIP}          ${newHostname}" /etc/hosts
#
echo "delete hostname and IP from knownhost if any"
ssh-keygen -R ${newHostname}
ssh-keygen -R ${newHostManagementIP}
#
echo "accept host keys"
./expectsshyesno.sh openstack ${newHostname}

echo "propagate credentials"
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@${newHostname}:/home/openstack/authorized_keys
#
sshpass -popenstack ssh  openstack@${newHostname} "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
#
echo "check date time of new compute node"
ssh  openstack@${newHostname} date
#
echo "set sudoers"
sshpass -popenstack scp files/adjustsudoer.sh openstack@${newHostname}:/home/openstack/adjustsudoer.sh
#
./expectsetsudoer.sh openstack ${newHostname} openstack
#
echo "set timezone on the new compute node"
ssh -t openstack@${newHostname} sudo timedatectl set-timezone Asia/Bangkok

echo "set date of the new compute node"
ssh -t openstack@${newHostname} sudo date --set=\"$(date)\"
#
#-----section 2
#
echo "copy installer tarball to the new compute node"
#read varkey
scp OPSInstaller.tar openstack@${newHostname}:/home/openstack/OPSInstaller.tar
#
echo "remove existing OPSInstaller on the new compute node"
ssh openstack@${newHostname} rm -rf /home/openstack/OPSInstaller 
#
echo "extract installer files on the new compute node."
ssh openstack@${newHostname} tar xvf /home/openstack/OPSInstaller.tar 
echo "replace parameters on the new compute node."
ssh openstack@${newHostname} /home/openstack/OPSInstaller/replace-newcompute-genericnames.sh ${newHostname} ${newHostManagementIPNic} ${newHostManagementIP} ${newHostManagementPhysicalNic} ${newHostDataTunnelIPNic} ${newHostDataTunnelIP} ${newHostDataTunnelPhysicalNic} ${newHostVlanIPNic} ${newHostVlanPhysicalNic} ${newHostExternalIPNic}
#
ssh openstack@${newHostname} /home/openstack/OPSInstaller/remove-all-except-newcompute.sh 
#
echo | ssh -t openstack@${newHostname}  sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage00-SUDO-update.sh | tee $HOME/log/s00-${newHostname}.log
#
ssh -t openstack@${newHostname}  sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage01-SUDO-set-compute-host-network.sh | tee $HOME/log/s00-${newHostname}.log
printf "\nWait until the rebooted node resume and proceed to run ./OS-newcompute-01-nova-neutron-ovs.sh \n"
