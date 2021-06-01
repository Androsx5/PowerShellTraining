<#

Add this snippet of code to the beginning of your PowerShell script, and a UAC prompt will appear, asking for administrative credentials or consent before any subsequent code is executed.

param([switch]$Elevated)
function Check-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false) {
if ($elevated)
{
# could not elevate, quit
}
else {
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
exit
}


#>


# verifico tutte le schede di rete sulla mia macchina
Get-NetAdapter 

# disabito solo la scheda di rete di Virtual Box
# Disable-NetAdapter -Name "VirtualBox Host-Only Network"
Get-NetAdapter -InterfaceIndex 17 | Disable-NetAdapter -Confirm:$false

# aspetto 3 secondi e poi riabilito la scheda di rete di Virtual Box
Start-Sleep -Milliseconds 3000

Get-NetAdapter -InterfaceIndex 17 | Enable-NetAdapter -Confirm:$false
