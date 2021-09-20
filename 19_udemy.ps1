<#$array = "a","b","c","d"

foreach ($i in $array) {

    Write-Host $i
}
#>

$files = Get-ChildItem -File

foreach($file in $files) {

    if ($file.Extension -eq ".txt"){

        Remove-Item $file
    }
}