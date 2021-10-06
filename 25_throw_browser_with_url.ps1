<#

.SYNOPSIS

Script che apre browser web a specifica url

.DESCRIPTION

Script che apre browser web a specifica url


#>

# [System.Diagnostics.Process]::Start("calc")

Start-Process "chrome.exe" "E:\index.html"