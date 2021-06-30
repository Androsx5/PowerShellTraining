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
$Form.Height = 500

$textBoxEth = New-Object system.windows.Forms.TextBox
$textBoxEth.Width = 200
$textBoxEth.Height = 200
$textBoxEth.location = new-object system.drawing.point(200,100)
$textBoxEth.AppendText($ethernet_ip.ToString())
$textBoxEth.ReadOnly = $true
$Form.controls.Add($textBoxEth)

$labeleth = New-Object system.windows.Forms.Label
$labeleth.Width = 100
$labeleth.Height = 100
$labeleth.location = new-object system.drawing.point(100,100)
$labeleth.Text = "Ethernet IP: "
$Form.controls.Add($labeleth)


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
if ($wifi_ip) { $textBoxWiFi.AppendText($wifi_ip.ToString()) }
$textBoxWiFi.ReadOnly = $true
$Form.controls.Add($textBoxWiFi)



$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(300,300)
$okButton.Text = 'OK'
$okButton.Width = 100
$okButton.Height = 60
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$Form.AcceptButton = $okButton
$Form.Controls.Add($okButton)



$form.Add_Shown({$form.Activate()})    
$dialogResult = $form.ShowDialog()