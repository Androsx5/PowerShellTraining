<#
function Display-DateTime {
    Get-Date
    Write-Host "The current Date and Time has been printed"
}
Display-DateTime
#>

function Get-Id {
    param ($Name="Notepad" , $Print)
    Get-Process $Name | Format-List ProcessName, Id
    Write-Host $Print
}

Get-Id -Print "Hello"

