
<#
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Data Entry Form'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please enter the information in the space below:'
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textBox.Text
    $x
}

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


$lblOutageIMG1 = New-Object system.windows.Forms.Label
$lblOutageIMG1.Width = 100
$lblOutageIMG1.Height = 100
$lblOutageIMG1.location = new-object system.drawing.point(100,200)
$lblOutageIMG1.Text = "Wi-Fi IP: "
$Form.controls.Add($lblOutageIMG1)

$txtOutageIMG1 = New-Object system.windows.Forms.TextBox
$txtOutageIMG1.Width = 200
$txtOutageIMG1.Height = 200
$txtOutageIMG1.location = new-object system.drawing.point(200,200)
$txtOutageIMG1.AppendText($wifi_ip.ToString())
$txtOutageIMG1.ReadOnly = $true
$Form.controls.Add($txtOutageIMG1)

$form.Add_Shown({$form.Activate()})    
$dialogResult = $form.ShowDialog()