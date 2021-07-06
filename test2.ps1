
# creo oggetto al volo
$v = [PSCustomObject]@{
    Nome = 'Alessandro'
    Cognome = 'Santerini'
    Dati = @(1,4,5, 73673)
    Oggetto = [PSCustomObject]@{
        Name = 22
    }
}

$v | ConvertTo-Json  | ConvertFrom-Json

# ConvertTo-Xml ottieni gli oggetti dell'albero XML (non la stringa)
# se si ha un file  xml lo si converte in XML utilizzando il casting con le quadre
[xml] (($v | ConvertTo-Xml).OuterXml)

# converte anche gli xml fatti a mano
[xml] '<?xml version="1.0" encoding="utf-8"?><MyDoc></MyDoc>'


1 .. 156 | 
Write-Host 

# test
