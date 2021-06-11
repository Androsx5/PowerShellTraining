<#
.Description
Questo scrit ha lo scopo di lanciare periodicamente (ogni ora del giorno dalle 8 alle 20) uno speedtest CLI verso il Server Vodafone di Milano
#>

Install-Module Send-MailKitMessage

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$pathspeedtestexe = "C:\Users\A.SANTERINI\speedtestcli\"
$exetorun = "speedtest.exe"
$server_vodafone_milano = "-s4302"
$server_tim_firenze = "-s9636"
$speedtestreport = "speedtest_report.txt"
$temp = "temp.txt"


if ( !(Test-Path -Path $pathspeedtestexe) -or !(Test-Path -Path $pathspeedtestexe$exetorun)) {

    [System.Windows.Forms.MessageBox]::Show("Path $pathspeedtestexe o $exetorun non esistente","Path o file non esistente")
    # [Environment]::Exit(1)
    exit 

}

# stile cd in dos
Set-Location -Path $pathspeedtestexe

# estraggo ora dalla data
[int]$hour = Get-Date -Format HH

# dalle 8 alle 20 faccio speedtest ogni ora
while($hour -lt 21 -and  $hour -gt 7) {

    # Invoke-Expression -Command $exetorun # > test.txt
    Add-Content -Path $speedtestreport -Value "-----------------------------------------------------------------------------------"
    Add-Content -Path $speedtestreport -Value $(Get-Date)
    
    # & $exetorun $server_vodafone_milano >> $speedtestreport

    Start-Process -FilePath $pathspeedtestexe$exetorun -ArgumentList $server_vodafone_milano -Wait -WindowStyle Hidden -RedirectStandardOutput $temp
    Add-Content -Path $speedtestreport -Value (Get-Content -Path $temp)
 
}


# cancello dopo aver inviato per mail -pulizia
Remove-Item -Path $pathspeedtestexe$speedtestreport
Remove-Item -Path $pathspeedtestexe$temp







# Send-MailMessage -To “Manager 1 <alessandro.santerini@gmail.com>" -From “Reports Admin <Reportadmin@xyx.com>" -SMTPServer smtp.gmail.com -Subject “Daily report” -Body “This is a daily report of server uptime”




