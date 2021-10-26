<#

.SYNOPSIS

Script che simula netest linux insieme a watch -n1

.DESCRIPTION

Questo script ha lo scopo di disabilitare l'account Guest di Windows


#>

while ($true) {

    Get-NetTCPConnection -State Established
    Write-Host "-----------------------------------------------------"
    Start-Sleep -Milliseconds 2000


}


# Get-NetTcpConnection -OwningProcess 18948

# Get-Process | select Id,ProcessName