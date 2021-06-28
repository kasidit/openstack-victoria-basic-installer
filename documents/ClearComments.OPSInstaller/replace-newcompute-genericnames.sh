#!/bin/bash
#
cd $HOME/OPSInstaller/
pwd
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
#
NEWCOMPUTE_ETC_FILES="newcompute/files/*"
NEWCOMPUTE_SCRIPT_FILES="newcompute/*.sh"
#
ORIG_Hostname=vasabi-1234GenericComputeHostname_hostname4321-ibasav
ORIG_HostManagementIPNic=vasabi-1234Genericcompute1_ip_nic4321-ibasav
ORIG_HostManagementIP=vasabi-1234GenericComputeHostname_ip4321-ibasav
ORIG_HostManagementPhysicalNic=vasabi-1234GenericPhysical_management_nic4321-ibasav
ORIG_HostDataTunnelIPNic=vasabi-1234data_tunnel_Genericcompute1_node_ip_nic4321-ibasav
ORIG_HostDataTunnelIP=vasabi-1234data_tunnel_GenericComputeHostname_node_ip4321-ibasav
ORIG_HostDataTunnelPhysicalNic=vasabi-1234GenericPhysical_data_tunnel_nic4321-ibasav
ORIG_HostVlanIPNic=vasabi-1234vlan_Genericcompute1_node_ip_nic4321-ibasav
ORIG_HostVlanPhysicalNic=vasabi-1234GenericPhysical_vlan_nic4321-ibasav
ORIG_HostExternalIPNic=vasabi-1234Genericexternal_cidr_nic4321-ibasav
#
sed -i "s/${ORIG_Hostname}/${newHostname}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostManagementIPNic}/${newHostManagementIPNic}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostManagementIP}/${newHostManagementIP}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostManagementPhysicalNic}/${newHostManagementPhysicalNic}/g" ${NEWCOMPUTE_ETC_FILES}
#
sed -i "s/${ORIG_HostDataTunnelIPNic}/${newHostDataTunnelIPNic}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostDataTunnelIP}/${newHostDataTunnelIP}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostDataTunnelPhysicalNic}/${newHostDataTunnelPhysicalNic}/g" ${NEWCOMPUTE_ETC_FILES}
#
sed -i "s/${ORIG_HostVlanIPNic}/${newHostVlanIPNic}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostVlanPhysicalNic}/${newHostVlanPhysicalNic}/g" ${NEWCOMPUTE_ETC_FILES}
#
sed -i "s/${ORIG_HostExternalIPNic}/${newHostExternalIPNic}/g" ${NEWCOMPUTE_ETC_FILES}
#
#
sed -i "s/${ORIG_Hostname}/${newHostname}/g" ${NEWCOMPUTE_SCRIPT_FILES}
sed -i "s/${ORIG_HostManagementIPNic}/${newHostManagementIPNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
sed -i "s/${ORIG_HostManagementIP}/${newHostManagementIP}/g" ${NEWCOMPUTE_SCRIPT_FILES}
sed -i "s/${ORIG_HostManagementPhysicalNic}/${newHostManagementPhysicalNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
#
sed -i "s/${ORIG_HostDataTunnelIPNic}/${newHostDataTunnelIPNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
sed -i "s/${ORIG_HostDataTunnelIP}/${newHostDataTunnelIP}/g" ${NEWCOMPUTE_SCRIPT_FILES}
sed -i "s/${ORIG_HostDataTunnelPhysicalNic}/${newHostDataTunnelPhysicalNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
#
sed -i "s/${ORIG_HostVlanIPNic}/${newHostVlanIPNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
sed -i "s/${ORIG_HostVlanPhysicalNic}/${newHostVlanPhysicalNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
#
sed -i "s/${ORIG_HostExternalIPNic}/${newHostExternalIPNic}/g" ${NEWCOMPUTE_SCRIPT_FILES}
#
