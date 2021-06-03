# Install-Module AzureAD

# Import-Module: Failure from remote command: Import-Module -Name 'AzureAD': Impossibile caricare il modulo 'AzureAD' specificato. Nessun file di modulo valido trovato nelle directory dei moduli.
Import-Module AzureAD -UseWindowsPowerShell

<# 
Una volta fatta l'autenticazione, da errore crittografia. 
Questa particolare libreria è stata sviluppata orginariamente per la PS di Windows ed non ha delle dipendeze
#>

# Connect-AzureAD

Get-Command | more

Get-Module

# tipo Top di SQL prende il primo della lista
# Get-Service | select * -First 1

function HelloWorld($hw, $hw2) {
   
    Write-Output "Hello World $hw $hw2"
    
}

HelloWorld "Ciao" -hw2 "2"

Get-Verb


#funzione
function Get-MrParameterCount {
    param ( # direttiva che consente non solo di indicare i parametri, ma consente di indicare il tipo di ciascun parametro e annotare i parametri con varie funzioni
        [string[]]$ParameterName
    )

    foreach ($Parameter in $ParameterName) {
        $Results = Get-Command -ParameterName $Parameter -ErrorAction SilentlyContinue

        [pscustomobject]@{
            ParameterName = $Parameter
            NumberOfCmdlets = $Results.Count
        }
    }
}

# da funzione a cmdlet

function Test-MrCmdletBinding {

    [CmdletBinding()] #<<-- This turns a regular function into an advanced function
    param (
        $ComputerName
    )

    Write-Output $ComputerName

}


function Test-MrSupportsShouldProcess {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        $ComputerName
    )

    Write-Output $ComputerName

}


function Test-MrParameterValidation {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ComputerName
    )

    Write-Output $ComputerName

}

Test-MrParameterValidation

# errori non sa gestire la Pipeline, serve più lavoro
1 .. 8 | Test-MrParameterValidation -ComputerName Pippo

function Test-MrPipelineInput {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline)]
                   # ValueFromPipelineByPropertyName
        [string[]]$ComputerName
    )

    PROCESS {
        Write-Output $ComputerName
    }

}

1 .. 8 | Test-MrPipelineInput


#gestione degli errori

function Test-MrErrorHandling {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   ValueFromPipelineByPropertyName)]
        [string[]]$ComputerName=@("Ciao")
    )

    PROCESS {
        foreach ($Computer in $ComputerName) {
            try {
                Test-WSMan -ComputerName $Computer
            }
            catch {
                Write-Warning -Message "Unable to connect to Computer: $Computer"
            }
        }
    }

}


# commentare funzioni

function Get-MrAutoStoppedService {

    <#
    .SYNOPSIS
        Returns a list of services that are set to start automatically, are not
        currently running, excluding the services that are set to delayed start.
    
    .DESCRIPTION
        Get-MrAutoStoppedService is a function that returns a list of services from
        the specified remote computer(s) that are set to start automatically, are not
        currently running, and it excludes the services that are set to start automatically
        with a delayed startup.
    
    .PARAMETER ComputerName
        The remote computer(s) to check the status of the services on.
    
    .PARAMETER Credential
        Specifies a user account that has permission to perform this action. The default
        is the current user.
    
    .EXAMPLE
         Get-MrAutoStoppedService -ComputerName 'Server1', 'Server2'
    
    .EXAMPLE
         'Server1', 'Server2' | Get-MrAutoStoppedService
    
    .EXAMPLE
         Get-MrAutoStoppedService -ComputerName 'Server1' -Credential (Get-Credential)
    
    .INPUTS
        String
    
    .OUTPUTS
        PSCustomObject
    
    .NOTES
        Author:  Mike F Robbins
        Website: http://mikefrobbins.com
        Twitter: @mikefrobbins
    #>
    
        [CmdletBinding()]
        param (
    
        )
    
        #Function Body
    
    }

    Get-Help Get-MrAutoStoppedService

    Get-Help Get-MrAutoStoppedService -Examples