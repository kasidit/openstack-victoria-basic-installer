#!/bin/bash

echo "Step 01-04 preinstall.. press"
read keyvars;
sudo ./Deploy-1node-01-SUDO-preinstall.sh
sudo ./Deploy-1node-02-SUDO-network-preinstall.sh
sudo ./Deploy-1node-03-SUDO-update.sh
sudo ./Deploy-1node-04-SUDO-compute-preinstall.sh
echo "Step 05 mysql.. press"
read keyvars;
sudo ./Deploy-1node-05-SUDO-mysql.sh
