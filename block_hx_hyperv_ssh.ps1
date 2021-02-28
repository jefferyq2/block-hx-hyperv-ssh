# Block and Allow SSH Access to Cisco HyperFlex on Microsoft Hyper-V Script, written by Ugo Emekauwa (uemekauw@cisco.com or uemekauwa@gmail.com)

# NOTE: Run this script on each server node in the HyperFlex on Microsoft Hyper-V cluster. Where listed below, set the variable $ServiceControllerVmIp to the IP of the service controller VM that is hosted by the corresponding server node.

# Set HyperFlex cluster IP
$HxClusterIP = 192.168.0.99

# Set HyperFlex service controller VM IP
$ServiceControllerVmIp = 192.168.0.105

# Block general SSH access to the HyperFlex cluster IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Deny" -Direction "Inbound" -LocalPort 22 -Protocol "TCP" -Weight 10

# Block general SSH access to the HyperFlex service controller VM IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Deny" -Direction "Inbound" -LocalPort 22 -Protocol "TCP" -Weight 11

# Allow selective SSH access to the HyperFlex cluster IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.99/32 -LocalPort 22 -Protocol "TCP" -Weight 12
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.100/30 -LocalPort 22 -Protocol "TCP" -Weight 14
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.104/29 -LocalPort 22 -Protocol "TCP" -Weight 16
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.1.170/32 -LocalPort 22 -Protocol "TCP" -Weight 18
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.1.200/32 -LocalPort 22 -Protocol "TCP" -Weight 20

# Allow selective SSH access to the HyperFlex service controller VM IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.99/32 -LocalPort 22 -Protocol "TCP" -Weight 13
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.100/30 -LocalPort 22 -Protocol "TCP" -Weight 15
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.104/29 -LocalPort 22 -Protocol "TCP" -Weight 17
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.1.170/32 -LocalPort 22 -Protocol "TCP" -Weight 19
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.1.200/32 -LocalPort 22 -Protocol "TCP" -Weight 21

# Exit
Exit
