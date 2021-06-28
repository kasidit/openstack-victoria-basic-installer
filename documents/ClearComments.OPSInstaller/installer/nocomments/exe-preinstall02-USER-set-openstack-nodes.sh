intype=full
full=full
pwd
echo "copy installer to nodes.. press"
scp OPSInstaller.tar openstack@controller:/home/openstack/OPSInstaller.tar
scp OPSInstaller.tar openstack@network:/home/openstack/OPSInstaller.tar
scp OPSInstaller.tar openstack@compute:/home/openstack/OPSInstaller.tar
if [ "$intype" == "$full" ]
then
scp OPSInstaller.tar openstack@compute1:/home/openstack/OPSInstaller.tar
fi
echo "remove existing OPSInstaller on controller node"
ssh openstack@controller rm -rf /home/openstack/OPSInstaller 
echo "remove existing OPSInstaller on network node"
ssh openstack@network rm -rf /home/openstack/OPSInstaller 
echo "remove existing OPSInstaller on compute node"
ssh openstack@compute rm -rf /home/openstack/OPSInstaller 
if [ "$intype" == "$full" ]
then
echo "remove existing OPSInstaller on compute1 node"
ssh openstack@compute1 rm -rf /home/openstack/OPSInstaller 
fi
echo "extract installer files on controller.. press"
ssh openstack@controller tar xvf /home/openstack/OPSInstaller.tar 
ssh openstack@controller /home/openstack/OPSInstaller/remove-all-except-controller.sh 
echo "extract installer files on network node.. press"
ssh openstack@network tar xvf /home/openstack/OPSInstaller.tar
ssh openstack@network /home/openstack/OPSInstaller/remove-all-except-network.sh 
echo "extract installer files on compute node.. press"
ssh openstack@compute tar xvf /home/openstack/OPSInstaller.tar 
ssh openstack@compute /home/openstack/OPSInstaller/remove-all-except-compute.sh
if [ "$intype" == "$full" ]
then
echo "extract installer files on compute1 node.. press"
ssh openstack@compute1 tar xvf /home/openstack/OPSInstaller.tar 
ssh openstack@compute1 /home/openstack/OPSInstaller/remove-all-except-compute1.sh 
fi
