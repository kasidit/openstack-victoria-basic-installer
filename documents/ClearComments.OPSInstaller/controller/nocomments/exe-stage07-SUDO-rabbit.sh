cd /home/openstack/OPSInstaller/controller; pwd
echo -n "* install rabbitmq.. press" 
apt-get -y install rabbitmq-server
echo -n "* set rabbitmq password for guest...press"
rabbitmqctl add_user openstack RABBIT_PASS
rabbitmqctl set_permissions openstack ".*" ".*" ".*"
printf "* install memcache..press\n"
apt-get -y install memcached python3-memcache
cp files/memcached.conf /etc/memcached.conf
service memcached restart
apt -y install etcd
cp files/etcd /etc/default/etcd
systemctl enable etcd
systemctl start etcd
