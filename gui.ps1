<#

.SYNOPSIS

Questo script ha lo scopo aprire una finestra con IP della macchina


.DESCRIPTION

descrizione più dettagliata

#>

$ethernet_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Ethernet'}
$wifi_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Wi-Fi'}
$connect_tunnel_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Connect Tunnel'}
$ethernet2_ip = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -eq 'Ethernet 2'}


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Network Info'
$main_form.Size = New-Object System.Drawing.Size(300,200)
$main_form.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Ethernet IP: '
$main_form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$textBox.AppendText($ethernet_ip.ToString())
$textBox.ReadOnly = $true
$textBox.BackColor = "Yellow"
$main_form.Controls.Add($textBox)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(40,30)
$label2.Size = New-Object System.Drawing.Size(310,20)
$label2.Text = 'Wi-FI IP: '
$main_form.Controls.Add($label2)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(105,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$main_form.AcceptButton = $okButton
$main_form.Controls.Add($okButton)


$okButton.Add_Click( {

    $main_form.Close()

}

)

$main_form.ShowDialog()



