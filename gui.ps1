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


Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form

$main_form.Text ='GUI for my PoSh script'

$main_form.Width = 600

$main_form.Height = 400

$main_form.AutoSize = $true

Write-Host $ethernet_ip


$Label2 = New-Object System.Windows.Forms.Label

$Label2.Text = "Ethernet IP: "

$Label2.Location  = New-Object System.Drawing.Point(0,40)

$Label2.AutoSize = $true

$main_form.Controls.Add($Label2)

$TextBox2 = New-Object System.Windows.Forms.TextBox

$TextBox2.Location = New-Object System.Drawing.Point(0,80)

$TextBox2.Text = $ethernet_ip

$main_form.Controls.Add($TextBox2)






$Button = New-Object System.Windows.Forms.Button

$Button.Location = New-Object System.Drawing.Size(400,10)

$Button.Size = New-Object System.Drawing.Size(120,23)

$Button.Text = "OK"

$main_form.Controls.Add($Button)



$Button.Add_Click( {

    $main_form.Close()

}

)

$main_form.ShowDialog()



