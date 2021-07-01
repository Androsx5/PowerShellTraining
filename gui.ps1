##[Ps1 To Exe]
##
##Kd3HDZOFADWE8uK1
##Nc3NCtDXThU=
##Kd3HFJGZHWLWoLaVvnQnhQ==
##LM/RF4eFHHGZ7/K1
##K8rLFtDXTiW5
##OsHQCZGeTiiZ4tI=
##OcrLFtDXTiW5
##LM/BD5WYTiiZ4tI=
##McvWDJ+OTiiZ4tI=
##OMvOC56PFnzN8u+Vs1Q=
##M9jHFoeYB2Hc8u+Vs1Q=
##PdrWFpmIG2HcofKIo2QX
##OMfRFJyLFzWE8uK1
##KsfMAp/KUzWJ0g==
##OsfOAYaPHGbQvbyVvnQX
##LNzNAIWJGmPcoKHc7Do3uAuO
##LNzNAIWJGnvYv7eVvnQX
##M9zLA5mED3nfu77Q7TV64AuzAgg=
##NcDWAYKED3nfu77Q7TV64AuzAgg=
##OMvRB4KDHmHQvbyVvnQX
##P8HPFJGEFzWE8tI=
##KNzDAJWHD2fS8u+Vgw==
##P8HSHYKDCX3N8u+Vgw==
##LNzLEpGeC3fMu77Ro2k3hQ==
##L97HB5mLAnfMu77Ro2k3hQ==
##P8HPCZWEGmaZ7/K1
##L8/UAdDXTlaDjofG5iZk2WqgcUkFWuCpkJiO+K6y+s7+sjPcCddUfFp+gCzuF0KpQLIdU7UlvcIQaTkvPPkf7aLsHPKgeqwfnfVwJeCWo9I=
##Kc/BRM3KXhU=
##
##
##fd6a9f26a06ea3bc99616d4851b372ba
<#

.SYNOPSIS

Questo script ha lo scopo aprire una finestra con IP della macchina e non solo


.DESCRIPTION

descrizione più dettagliata

#>

$ethernet_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Ethernet'}
$wifi_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Wi-Fi'}
$connect_tunnel_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Connect Tunnel'}
$ethernet2_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Ethernet 2'}


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")



$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Network Info"
$Form.TopMost = $true
$Form.Width = 500
$Form.Height = 630


$labeleth = New-Object system.windows.Forms.Label
$labeleth.Width = 100
$labeleth.Height = 100
$labeleth.location = new-object system.drawing.point(100,100)
$labeleth.Text = "Ethernet IP: "
$Form.controls.Add($labeleth)

$textBoxEth = New-Object system.windows.Forms.TextBox
$textBoxEth.Width = 200
$textBoxEth.Height = 200
$textBoxEth.location = new-object system.drawing.point(200,100)
$textBoxEth.BackColor = "Red"
if ($ethernet_ip) { 
    
    $textBoxEth.AppendText($ethernet_ip.ToString())
    $textBoxEth.BackColor = "#FF8FBC8B" 

}
$textBoxEth.ReadOnly = $true
$Form.controls.Add($textBoxEth)



$labelwifi = New-Object system.windows.Forms.Label
$labelwifi.Width = 100
$labelwifi.Height = 100
$labelwifi.location = new-object system.drawing.point(100,200)
$labelwifi.Text = "Wi-Fi IP: "
$Form.controls.Add($labelwifi)


$textBoxWiFi = New-Object system.windows.Forms.TextBox
$textBoxWiFi.Width = 200
$textBoxWiFi.Height = 200
$textBoxWiFi.location = new-object system.drawing.point(200,200)
$textBoxWiFi.BackColor = "Red"
if ($wifi_ip) { 
    
    $textBoxWiFi.AppendText($wifi_ip.ToString())
    $textBoxWiFi.BackColor = "#FF8FBC8B"

}
$textBoxWiFi.ReadOnly = $true
$Form.controls.Add($textBoxWiFi)

$labelct = New-Object system.windows.Forms.Label
$labelct.Width = 100
$labelct.Height = 100
$labelct.location = new-object system.drawing.point(100,300)
$labelct.Text = "Connect Tunnel IP:"
$Form.controls.Add($labelct)

$textBoxCt = New-Object system.windows.Forms.TextBox
$textBoxCt.Width = 200
$textBoxCt.Height = 200
$textBoxCt.location = new-object system.drawing.point(200,300)
$textBoxCt.BackColor = "Red"
if ($connect_tunnel_ip) { 
    
    $textBoxCt.AppendText($connect_tunnel_ip.ToString())
    $textBoxCt.BackColor = "#FF8FBC8B" 

}
$textBoxCt.ReadOnly = $true
$Form.controls.Add($textBoxCt)


$labeleth2 = New-Object system.windows.Forms.Label
$labeleth2.Width = 100
$labeleth2.Height = 100
$labeleth2.location = new-object system.drawing.point(100,400)
$labeleth2.Text = "Ethernet 2 (Eventuale Adattatore) IP: "
$Form.controls.Add($labeleth2)

$textBoxeth2 = New-Object system.windows.Forms.TextBox
$textBoxeth2.Width = 200
$textBoxeth2.Height = 200
$textBoxeth2.location = new-object system.drawing.point(200,400)
$textBoxeth2.BackColor = "Red"
if ($ethernet2_ip) { 
    
    $textBoxeth2.AppendText($ethernet2_ip.ToString())
    $textBoxeth2.BackColor = "#FF8FBC8B" 

}
$textBoxeth2.ReadOnly = $true
$Form.controls.Add($textBoxeth2)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(350,500)
$okButton.Text = 'OK'
$okButton.Width = 100
$okButton.Height = 60
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.AcceptButton = $okButton
$Form.Controls.Add($okButton)


$Form.Add_Shown({$Form.Activate()})    
$dialogResult = $Form.ShowDialog()