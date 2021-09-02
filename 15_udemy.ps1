<#

$a = Read-Host "Enter a number"
if ($a -gt 5) {

    Write-Host "The value $a is greater than 5"

}

elseif($a -eq 5) {
    
    Write-Host "The value $a is equal than 5"

}
else {

    Write-Host "The value $a is less than 5"

}

#>

$process_name = Read-Host "Enter Name of the application"
$process_object = Get-Process $process_name

if ($process_object.Responding) {

    Write-Host "$process_name is working correctly"
}
else {

    Write-Name "$process_name is unresponsive, closing..."
    $process_object.Kill()

}




