<# Try {

    Throw "Error Occurred"

}
Catch {

    Write-Host "Error Occurred...continuing.."
}

Write-Host "Hello"

#>

$ErrorActionPreference = "Stop" # for terminating error
$Name = Read-host "Enter a name for the new file"
$Path = Read-Host "Enter a path"

Try {

New-Item -Path $Path -Name $Name -ItemType File  # -EA Stop for terminating error

}

Catch {

    Write-Host "Error occurred"

}
Finally {

    $Date = Get-Date
    Write-Host "An attempt was made to create a file at: $Date"
}
Write-Host "Done"