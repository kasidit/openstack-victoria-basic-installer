# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x 
#
intype=vasabi-1234install_type4321-ibasav
full=full
#
#ssh-keygen -t rsa
#
echo "create new public-private keys"
#
rm /home/vasabi-1234loginname4321-ibasav/.ssh/*
#
./expectssh-keygen.sh
#
echo "accept host keys"
./expectsshyesno.sh vasabi-1234loginname4321-ibasav controller 
./expectsshyesno.sh vasabi-1234loginname4321-ibasav compute

echo "propagate credentials"
sshpass -pvasabi-1234loginpassword4321-ibasav scp /home/vasabi-1234loginname4321-ibasav/.ssh/id_rsa.pub vasabi-1234loginname4321-ibasav@controller:/home/vasabi-1234loginname4321-ibasav/authorized_keys
sshpass -pvasabi-1234loginpassword4321-ibasav scp /home/vasabi-1234loginname4321-ibasav/.ssh/id_rsa.pub vasabi-1234loginname4321-ibasav@compute:/home/vasabi-1234loginname4321-ibasav/authorized_keys

sshpass -pvasabi-1234loginpassword4321-ibasav ssh  vasabi-1234loginname4321-ibasav@controller "(mkdir /home/vasabi-1234loginname4321-ibasav/.ssh; mv /home/vasabi-1234loginname4321-ibasav/authorized_keys /home/vasabi-1234loginname4321-ibasav/.ssh/authorized_keys)"
sshpass -pvasabi-1234loginpassword4321-ibasav ssh  vasabi-1234loginname4321-ibasav@compute "(mkdir /home/vasabi-1234loginname4321-ibasav/.ssh; mv /home/vasabi-1234loginname4321-ibasav/authorized_keys /home/vasabi-1234loginname4321-ibasav/.ssh/authorized_keys)"

echo "check date time of controller network compute"
ssh  vasabi-1234loginname4321-ibasav@controller date
ssh  vasabi-1234loginname4321-ibasav@compute date

echo "set sudoers"
sshpass -pvasabi-1234loginpassword4321-ibasav scp files/adjustsudoer.sh vasabi-1234loginname4321-ibasav@controller:/home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh
sshpass -pvasabi-1234loginpassword4321-ibasav scp files/adjustsudoer.sh vasabi-1234loginname4321-ibasav@compute:/home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh

./expectsetsudoer.sh vasabi-1234loginname4321-ibasav controller vasabi-1234loginpassword4321-ibasav
./expectsetsudoer.sh vasabi-1234loginname4321-ibasav compute vasabi-1234loginpassword4321-ibasav

echo "set timezone of controller network compute"
ssh -t vasabi-1234loginname4321-ibasav@compute sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav

echo "set date of controller network compute"
ssh -t vasabi-1234loginname4321-ibasav@compute sudo date --set=\"$(date)\"
