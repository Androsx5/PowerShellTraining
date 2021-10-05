<#

.SYNOPSIS

Script che individua la data di creazione di un utente Windows

.DESCRIPTION

Viene usato il trick di individuare la data di creazione della cartella utente dentro C:\Users


#>

# Get-WinEvent -ListLog *

function get-logonhistory{
    cls
    $Result = @()
    Write-Host "Gathering Event Logs, this can take awhile..."
    $ELogs = Get-WinEvent -ea SilentlyContinue ` -ProviderName “Microsoft-Windows-Winlogon”| Where-Object { $_.TimeCreated -le [datetime]::today}

    If ($ELogs) { Write-Host "Processing..."
        ForEach ($Log in $ELogs) { 
            If ($Log.Id -eq 7001)
      { 
          
        $ET = "Logon"
      }

    ElseIf ($Log.Id -eq 7002) { 

        $ET = "Logoff"
    }
    
    Else { 
        
        Continue
    }
      $SID = $Log.Properties.Value.Value
      $objSID = New-Object System.Security.Principal.SecurityIdentifier $SID
      $objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
      $Result += New-Object PSObject -Property @{
       'Date/Time' = $Log.TimeCreated
       'Event Type' = $ET
       User = $objUser.Value
      }
    }
    $Result | Select "Date/Time","Event Type",User | Sort Time -Descending | Out-GridView -Title "System Logon Events"
    Write-Host "Done."
    }
    Else
    { Write-Host "There was a problem reading the logs..."
    }
   }
   
   
   get-logonhistory
