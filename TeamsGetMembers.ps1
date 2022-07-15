<#

.SYNOPSIS

Questo script ha lo scopo di leggere i Team dell'utente ed esportare i suoi members in in file csv per ogni team

.DESCRIPTION

Prerequisito in caso non funzionasse il modulo Teams installato di default

Install-Module MicrosoftTeams
Uninstall-Module MicrosoftTeams
Install-Module MicrosoftTeams -AllowPrerelease -RequiredVersion "2.4.1-preview"
# Import-Module MicrosoftTeams

#>

    # Apre il default browser per inserire per le proprie credenziali
    Connect-MicrosoftTeams

    $Teamname = Read-Host "Digita il nome del Team che ti interessa (Eg. Teamname , Team*,*Team)"

    # seleziono tutti i Team che matchano la stringa $Teamname
    $Team = Get-Team -DisplayName $Teamname

    Foreach ($T in $Team) {

        $displayname = $T.DisplayName
  
        Get-TeamUser -GroupId $T.GroupId | Select-Object User, Name, Role | Export-Csv -Path "$displayname.csv"

    }

   

    




