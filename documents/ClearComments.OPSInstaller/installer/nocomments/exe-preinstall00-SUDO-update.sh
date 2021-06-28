cp files/hosts /etc/hosts
 
apt-get update
echo "Make sure to adjust the sudoer file to allow sudo without password."
read;
apt-get -y install --no-install-recommends expect 
apt-get -y install sshpass
