<#

.SYNOPSIS

Script che individua il SID utente

.DESCRIPTION

Script che individua il SID utente


#>


$username='A.SANTERINI'
$user = New-Object System.Security.Principal.NTAccount($username) 
$sid = $user.Translate([System.Security.Principal.SecurityIdentifier]) 
$sid.Value

# al contrario da SID estraggo local user
$sid='S-1-5-21-1217296733-830797881-724072272-1003'
$osid = New-Object System.Security.Principal.SecurityIdentifier($sid)
$user = $osid.Translate( [System.Security.Principal.NTAccount])
$user.Value