#!/bin/bash

set -ex

INTERFACE=o-hm0
MGMT_PORT_MAC=vasabi-1234-octavia_mgmt_port_mac-4321-ibasav
MGMT_PORT_ID=vasabi-1234-octavia_mgmt_port_id-4321-ibasav

if [ "$1" == "start" ]; then
  ovs-vsctl -- --may-exist add-port br-int $INTERFACE -- set Interface $INTERFACE type=internal -- set Interface $INTERFACE external-ids:iface-status=active -- set Interface $INTERFACE external-ids:attached-mac=$MGMT_PORT_MAC -- set Interface $INTERFACE external-ids:iface-id=$MGMT_PORT_ID -- set Interface $INTERFACE external-ids:skip_cleanup=true
  ip link set dev $INTERFACE address $MGMT_PORT_MAC
  iptables -I INPUT -i $INTERFACE -p udp --dport 5555 -j ACCEPT
elif [ "$1" == "stop" ]; then
  ip link del $INTERFACE
else
  ovs-vsctl show
  ip a s dev $INTERFACE
fi
