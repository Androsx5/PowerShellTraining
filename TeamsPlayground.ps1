# Install-Module MicrosoftTeams

# Get-InstalledModule
# Get-Module
# Get-Command

Import-Module MicrosoftTeams

Connect-MicrosoftTeams

$myteams = Get-Team -User a049611@unipi.it

#data type dizionario
$dict = @{ a="Ciao"; b=2}

# $dict
# $dict["b"]

$dict.Add("ab",3)
$dict

# $myteams | Out-GridView

$myteams | Out-String

$idx = @{}

foreach ($t in $myteams) {

    $v = $t.Visibility
    if (-not ($idx.ContainsKey($v))) {

        $idx[$v] = @($t)
    } else {

        $idx[$v] += $t
    }

}


$idx.Keys | ForEach-Object -Process { $o = New-Object pscustomobject -Property @{Name=$_; Group=$idx[$_]}; $o}

# modo in cui in poweshell di fanno gli oggetti
$o = new-object pscustomobject -Property @{

    Name = "A"
    KK = "B"

}

# viene dato un nome a un blocco di codice
# $code = {Invoke-WebRequest https://www.unipi.it}

# ottengo dizionario oggetti Privati
# $idx["Private"]

# ottengo dizionario oggetti Privati tramite cmdlet Where-Object.    $_ sta per oggetto corrente cioè oggetto Team in questo caso
$myteams | Where-Object { $_.Visibility -eq 'Private' }

# raggruppo stile SQL stesso risultato di cui sopra con anche una colonna di Count
$myteams | Group-Object Visibility

# usato per il conteggio e moltri altri parametri
# $idx["Private"] | Measure-Object

$myteams | Export-Csv pippo.csv -Delimiter ';'

#nota il tipo
$myteams[0].GetType()

$h = Import-Csv -Delimiter ';' pippo.csv

#nota il tipo
$h[0].GetType()
