# Block SSH Access to Cisco HyperFlex on Microsoft Hyper-V Script, written by Ugo Emekauwa (uemekauw@cisco.com or uemekauwa@gmail.com)

# NOTE: Run this script on each server node in the HyperFlex cluster. Where listed below, set the HyperFlex Service Controller VM IP that matches with the server node.

# Set HyperFlex Cluster IP
$HxClusterIP = 192.168.0.100

# Set HyperFlex Service Controller VM IP
$ServiceControllerVmIp = 192.168.0.104

# Block SSH Access on to HyperFlex Cluster IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $HxClusterIP -Action "Deny" -Direction "Inbound" -LocalPort 22 -Protocol "TCP" -Weight 10

# Block SSH Access to HyperFlex Service Controller VM IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress $ServiceControllerVmIp -Action "Deny" -Direction "Inbound" -LocalPort 22 -Protocol "TCP" -Weight 11

# Allow SSH Access on to HyperFlex Cluster IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress 192.168.0.100 -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.100/32 -LocalPort 22 -Protocol "TCP" -Weight 12
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress 192.168.0.100 -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.170/32 -LocalPort 22 -Protocol "TCP" -Weight 13
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress 192.168.0.100 -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.200/32 -LocalPort 22 -Protocol "TCP" -Weight 14

# Allow SSH Access to HyperFlex Service Controller VM IP
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress 192.168.0.104 -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.100/32 -LocalPort 22 -Protocol "TCP" -Weight 15
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress 192.168.0.104 -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.170/32 -LocalPort 22 -Protocol "TCP" -Weight 16
Add-VMNetworkAdapterExtendedAcl -VMName "StCtlVM" -LocalIPAddress 192.168.0.104 -Action "Allow" -Direction "Inbound" -RemoteIPAddress 192.168.0.200/32 -LocalPort 22 -Protocol "TCP" -Weight 17


# Exit
Exit
