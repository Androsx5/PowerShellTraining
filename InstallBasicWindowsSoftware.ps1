<#

.SYNOPSIS

Questo script ha lo scopo di installare in automatico i software base di una macchina Windows appena formatta

LISTA SOFTWARE:
7Zip


.DESCRIPTION

descrizione più dettagliata

#>

# effettuare check se script parte con diritti di amministratore   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-----------------------------------------


# Source file location
$7zip_uri = 'https://www.7-zip.org/a/7z1900-x64.msi'
$7zip_name = "7z1900-x64.msi"
# Destination to save the file
$pathtmp = 'C:\tmp_ps_script\'

if ( !(Test-Path -Path $pathtmp) ) {

    New-Item -Path "c:\" -Name "tmp_ps_script" -ItemType "directory" 

}

Set-Location -Path $pathtmp

#Download the file
Invoke-WebRequest -Uri $7zip_uri -OutFile $7zip_name

Start-Process -FilePath "$env:systemroot\system32\msiexec.exe" -ArgumentList "/i `"$7zip_name`" /n /passive" -Wait


# 

