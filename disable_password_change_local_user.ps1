<#

.SYNOPSIS

Script che apre disabilita possibilit√† cambio password utente locale

.DESCRIPTION

Script che apre disabilita possibilit√† cambio password utente locale


#>



Set-LocalUser -Name "GOKU" -UserMayChangePassword 0 -PasswordNeverExpires 1 

Get-LocalUser -Name "GOKU"| select *







