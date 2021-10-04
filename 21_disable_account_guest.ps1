<#

.SYNOPSIS

Script che apre disabilita account Guest di Windows

.DESCRIPTION

Questo script ha lo scopo di disabilitare l'account Guest di Windows


#>

$localUser = Get-LocalUser # | Select-Object Name,Enabled

foreach ($i in $localUser) {

    if ( ($i.Name -eq "Guest") -and ($i.Enabled -eq $false))  {
        
        # Write-Host("beccato una volta")
        Enable-LocalUser -Name "Guest"
    }

}

<#

Get-LocalUser

Disable-LocalUser -Name "Guest"

Get-LocalUser

#>


