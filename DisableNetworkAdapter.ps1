# verifico tutte le schede di rete sulla mia macchina
Get-NetAdapter 

# disabito solo la scheda di rete di Virtual Box
# Disable-NetAdapter -Name "VirtualBox Host-Only Network"
Get-NetAdapter -InterfaceIndex 17 | Disable-NetAdapter -Confirm:$false