<#

.SYNOPSIS

Script che disabilita e riabilita il servizio 802.1X 

.DESCRIPTION

Script che disabilita e riabilita il servizio 802.1X 

#>

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

<#

Running  Name: dot3svc            Configurazione automatica reti cablate

Get-Help \*-Service

Get-Service -Name dot3svc -RequiredServices

Status   Name               DisplayName
------   ----               -----------
Running  RpcSs              Chiamata di procedura remota (RPC)
Running  Ndisuio            NDIS Usermode I/O Protocol
Running  Eaphost            Extensible Authentication Protocol


  Get-Service -Name dot3svc | Where-Object {$_.RequiredServices -or $_.DependentServices} |
  Format-Table -Property Status, Name, RequiredServices, DependentServices -auto

#>

$req_serv = Get-Service -Name dot3svc -RequiredServices

# se i servici dipendenti di dor3svc non sono running segnalalo e esci dallo script
foreach ($obj in $req_serv) {

    if (!($obj.Status -like "Running")) {

      
      [System.Windows.Forms.MessageBox]::Show("Il servizio "+$obj.Name+" ("+$obj.DisplayName+") non è in Running Status, da avviare manualmente","Servizio richiesto da dot3svc non in RUNNING")
      exit

    }

}

# se lo stato di dot3srv non è running lo avvio ed imposto avvio automatico allo startup
if (! (Get-Service -Name dot3svc).Status -like "Running") {

  Set-Service -Name dot3svc -Status Running
  Set-Service -Name dot3svc -StartupType Automatic

}

<# 

############################################## DA TESTARE  SULLA VM: ###############################################

1)

netsh lan show interfaces

netsh lan export profile folder=c:\temp interface="Ethernet"

---------->> UNA VOLTA ESPORTATO IL FILE DI CONFIGURAZIONE DELLA ETHERNET BISOGNA CAPIRE I TAG DENTRO L'XMS SE CORRISPONDO A QUELLO CHE CERCO

ESEMPIO:

<authMode>machineOrUser</authMode> CORRISPONDE ALLA MODALITA' DI AUTH 802.1X UTENTE O COMPUTER

DA VEDERE SE DENTRO L'XML SI TROVA UN TAG RIGUARDO LE PROPRIETA' PEAP PER DISABILITARE LA VERICA CON CERTIFICATO

2)

-------->> OPPURE CERCA DI LAVORARE SULLE CHIAVI DI REGISTRO - DA PROVARE

uncheck flags verifica identità con certificato da provare queste 2 soluzioni con chiavi di registro sul vm di test

2: you add a DWORD 0 at HKLM\Comm\EAP\Extension\25\ValidateServerCert (http://www.modaco.com/How_to_set_a_wifi_network_to_use_a_certificatel-t237261.html)

3: Hkey_Current_User\Software\Microsoft\ActiveSync\Partners

Here you should notice 2 sub-keys, both with a unique UID. One is set up for the ActiveSync Partnership with your PC, the other is set up for the partnership with your Exchange server. Fortunately, it is fairly easy to distinguish between the two. Simply highlight one of them, and look at the different values. You'll see pretty quickly which one is for your Exchange server. While the partner key for your Exchange server is highlighted, create a new value with the following parameters

Type: DWORD
Name: secure
Value: 0 (http://winzenz.blogspot.com/2006/03/hacking-your-windows-mobile-50.html)

#>








  

