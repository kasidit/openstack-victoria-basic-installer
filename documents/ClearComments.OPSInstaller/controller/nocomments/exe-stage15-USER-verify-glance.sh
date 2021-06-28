cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
echo -n "Get cirros image..."
source ./admin-openrc.sh
wget http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-x86_64-disk.img
printf "\nUpload cirros image to glance...\n"
openstack image create "cirros" \
	  --file cirros-0.4.0-x86_64-disk.img \
	    --disk-format qcow2 --container-format bare \
	      --public
printf "\nList glnace images and remove cirros file...\n"
openstack image list
rm cirros-0.4.0-x86_64-disk.img
