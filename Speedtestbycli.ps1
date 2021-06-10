<#
.Description
Questo scrit ha lo scopo di lanciare periodicamente (ogni ora del giorno) uno speedtest CLI verso il Server Vodafone di Milano
#>

Install-Module Send-MailKitMessage

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$pathspeedtestexe = "C:\Users\A.SANTERINI\speedtestcli\"
$exetorun = ".\speedtest.exe"

if (!(Test-Path -Path $pathspeedtestexe)) {

    [System.Windows.Forms.MessageBox]::Show("Path $pathspeedtestexe non esiste","Path non esistente")
    # [Environment]::Exit(1)
    exit 

}

# stile cd in dos
Set-Location -Path $pathspeedtestexe

# Invoke-Expression -Command $exetorun # > test.txt
& $exetorun


Send-MailMessage -To “Manager 1 <alessandro.santerini@gmail.com>" -From “Reports Admin <Reportadmin@xyx.com>" -SMTPServer smtp.gmail.com -Subject “Daily report” -Body “This is a daily report of server uptime”




