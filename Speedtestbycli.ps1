<#

.SYNOPSIS

Questo scrit ha lo scopo di lanciare uno speedtest ogni ora e inviare un report via mail alle 23

.DESCRIPTION

Utilizzato server Vodafone di Milano (considerato uno dei più affidabili)

#>

Install-Module Send-MailKitMessage

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null
$pathspeedtestcli = "C:\Users\A.SANTERINI\speedtestcli\"
$pathspeedtestcliexe = "C:\Users\A.SANTERINI\speedtestcli\speedtest.exe"
$server_vodafone_milano = "-s4302"
$server_tim_firenze = "-s9636"
$speedtestreport = "C:\Users\A.SANTERINI\speedtestcli\speedtest_report.txt"
$temp = "C:\Users\A.SANTERINI\speedtestcli\temp.txt"


if ( !(Test-Path -Path $pathspeedtestcliexe) ) {

    [System.Windows.Forms.MessageBox]::Show("Path $pathspeedtestcli non esistente","Path o file non esistente")
    exit 

}

# stile cd in dos
# Set-Location -Path $pathspeedtestcli

# estraggo ora dalla data
[int]$hour = Get-Date -Format HH
[int]$min = Get-Date -Format mm
[int]$seconds = Get-Date -Format ss


# ogni ora aggiorno il report e alle 23 invio mail ed esco dallo script
while($true) {  

    if ($min -eq 00 -and $seconds -eq 00) {

        Add-Content -Path $speedtestreport -Value "-----------------------------------------------------------------------------------"
        Add-Content -Path $speedtestreport -Value $(Get-Date)
        Add-Content -Path $speedtestreport -Value "-------------------"
        Add-Content -Path $speedtestreport -Value $((Invoke-WebRequest -uri "http://ifconfig.me/ip").Content)
        Add-Content -Path $speedtestreport -Value "-------------------"
        
        # & $exetorun $server_vodafone_milano >> $speedtestreport
        Start-Process -FilePath $pathspeedtestcliexe -ArgumentList $server_vodafone_milano -Wait -WindowStyle Hidden -RedirectStandardOutput $temp
        Add-Content -Path $speedtestreport -Value (Get-Content -Path $temp)

    }

    if ($hour -eq 23) { break }
    
    [int]$hour = Get-Date -Format HH

    [int]$min = Get-Date -Format mm

    [int]$seconds = Get-Date -Format ss

     
}


# preparo invio report per mail prima di uscire dallo script
$uid = "info@alessandrosanterini.it"
$pwd = "01000000d08c9ddf0115d1118c7a00c04fc297eb01000000e00df9985181374ba4d072447aa97ecc000000000200000000001066000000010000200000008bfdd65accf3466fa9425509a7793b066b6fa1931d7fe623de072ba7317471d9000000000e8000000002000020000000a6f0d01c319afd58bdb883d83a8dd60ec99a55700b990eb34b62c71804eadd9c20000000190b6c70aaa0cf188aa3a242f3db39fcbf8dbf60b6117c8db735d3edbc33250f400000005a6d1ee88b6ae88972f6146e6b9d67599f12e610ede831938b2966967c7d027bc0079bfa738cb72e49c6734177e823858dfca21d1726a2fcc31012b468623c6f"

$spwd = ConvertTo-SecureString $pwd
$Cred = New-Object System.Management.Automation.PSCredential ($uid,$spwd)

#PSCredential Object al volo
$sendMailParams = @{
    From = 'speedtestmonitor@speedtest.it' 
    To = 'alessandro.santerini@unipi.it'
    Subject = "Report Speedtest $(Get-Date -Format dd)/$(Get-Date -Format MM)/$(Get-Date -Format yyyy)"
    Body = 'Report Speedtest in allegato'
    SMTPServer = 'smtp.alessandrosanterini.it'
    Credential = $Cred
    Attachments = $speedtestreport
}

Send-MailMessage @sendMailParams

# cancello dopo aver inviato per mail -pulizia
Remove-Item -Path $speedtestreport
Remove-Item -Path $temp









