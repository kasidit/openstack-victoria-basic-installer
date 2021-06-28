# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd /home/openstack/OPSInstaller/controller; pwd
echo "Run this script as a user."
echo -n "Create Identity service and endpoint..."

export OS_USERNAME=admin
export OS_PASSWORD=adminpassword
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://controller:5000/v3
export OS_IDENTITY_API_VERSION=3

echo -n "Create Admin projects, users, and roles..."
echo openstack domain create --description "An Example Domain" example
openstack domain create --description "An Example Domain" example
echo openstack project create --domain default --description "Service Project" service
openstack project create --domain default --description "Service Project" service
#
echo openstack project create --domain default --description "Demo Project" demoproject
openstack project create --domain default --description "Demo Project" demoproject
echo openstack user create --domain default --password demopassword demo
openstack user create --domain default --password demopassword demo
# This is needed for all users
echo openstack role create user
openstack role create user
#
echo openstack role add --project demoproject --user demo user
openstack role add --project demoproject --user demo user

printf "\nVerify keystone Id Service...get a token by user id...\n"

unset OS_AUTH_URL OS_PASSWORD

openstack --os-auth-url http://controller:5000/v3 \
  --os-project-domain-name default --os-user-domain-name default \
  --os-project-name admin --os-username admin --os-password adminpassword token issue

openstack --os-auth-url http://controller:5000/v3 \
  --os-project-domain-name default --os-user-domain-name default \
  --os-project-name demoproject --os-username demo --os-password demopassword token issue

