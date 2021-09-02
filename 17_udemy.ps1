for ($i=1; $i -le 30; $i+=1){

    $name = "File_$i.txt"
    $path = Join-Path -path "C:\Users\A.SANTERINI\OneDrive - University of Pisa\Desktop" -ChildPath "$name"
    New-Item $path  -ItemType File
    Write-Host "$name created at: $path"

}