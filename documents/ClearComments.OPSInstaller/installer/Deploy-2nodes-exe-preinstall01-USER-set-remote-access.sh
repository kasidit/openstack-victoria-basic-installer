# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x 
#
intype=full
full=full
#
#ssh-keygen -t rsa
#
echo "create new public-private keys"
#
rm /home/openstack/.ssh/*
#
./expectssh-keygen.sh
#
echo "accept host keys"
./expectsshyesno.sh openstack controller 
./expectsshyesno.sh openstack compute

echo "propagate credentials"
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@controller:/home/openstack/authorized_keys
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@compute:/home/openstack/authorized_keys

sshpass -popenstack ssh  openstack@controller "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
sshpass -popenstack ssh  openstack@compute "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"

echo "check date time of controller network compute"
ssh  openstack@controller date
ssh  openstack@compute date

echo "set sudoers"
sshpass -popenstack scp files/adjustsudoer.sh openstack@controller:/home/openstack/adjustsudoer.sh
sshpass -popenstack scp files/adjustsudoer.sh openstack@compute:/home/openstack/adjustsudoer.sh

./expectsetsudoer.sh openstack controller openstack
./expectsetsudoer.sh openstack compute openstack

echo "set timezone of controller network compute"
ssh -t openstack@compute sudo timedatectl set-timezone Asia/Bangkok

echo "set date of controller network compute"
ssh -t openstack@compute sudo date --set=\"$(date)\"
