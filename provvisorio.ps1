Function Get-FileName ($initialDirectory)
{
[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null
$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openfiledialog.Multiselect = $true
$OpenFileDialog.Title = "Choose an image"
$OpenFileDialog.InitialDirectory = $initialDirectory
$OpenFileDialog.Filter = 'Images (*.jpg, *.png)|*.jpg;*.png'
$OpenFileDialog.ShowDialog() | Out-Null
$OpenFileDialog.FileName

If($OpenFileDialog.Filename -like "*" -And $txtOutageIMG.Text -notlike "*"){
	$txtOutageIMG.Text = $OpenFileDialog.FileName}
	ElseIf($OpenFileDialog.Filename -like "*" -And $txtOutageIMG.Text -like "*"){
	$txtOutageIMG1.Text = $OpenFileDialog.FileName}
Else {
Write-Host "Cancelled by User"
}
}

$Form = New-Object system.Windows.Forms.Form
$Form.Text = "Form"
$Form.TopMost = $true
$Form.Width = 700
$Form.Height = 700

$txtOutageIMG = New-Object system.windows.Forms.TextBox
$txtOutageIMG.Width = 300
$txtOutageIMG.Height = 300
$txtOutageIMG.location = new-object system.drawing.point(200,100)
$txtOutageIMG.Font = "Microsoft Sans Serif,10"
$txtOutageIMG.Text = ""
$Form.controls.Add($txtOutageIMG)

$lblOutageIMG = New-Object system.windows.Forms.Label
$lblOutageIMG.Width = 100
$lblOutageIMG.Height = 100
$lblOutageIMG.location = new-object system.drawing.point(100,100)
$lblOutageIMG.Font = "Microsoft Sans Serif,10"
$lblOutageIMG.Text = "Outage"
$Form.controls.Add($lblOutageIMG)

$txtOutageIMG1 = New-Object system.windows.Forms.TextBox
$txtOutageIMG1.Width = 300
$txtOutageIMG1.Height = 300
$txtOutageIMG1.location = new-object system.drawing.point(200,200)
$txtOutageIMG1.Font = "Microsoft Sans Serif,10"
$txtOutageIMG1.Text = ""
$Form.controls.Add($txtOutageIMG1)

$lblOutageIMG1 = New-Object system.windows.Forms.Label
$lblOutageIMG1.Width = 100
$lblOutageIMG1.Height = 100
$lblOutageIMG1.location = new-object system.drawing.point(100,200)
$lblOutageIMG1.Font = "Microsoft Sans Serif,10"
$lblOutageIMG1.Text = "Outage 1"
$Form.controls.Add($lblOutageIMG1)

$btnBrowseImg = New-Object system.windows.Forms.Button
$btnBrowseImg.Text = "Browse for Image"
$btnBrowseImg.Width = 200
$btnBrowseImg.Height = 60
$btnBrowseImg.location = new-object system.drawing.point(10,300)
$btnBrowseImg.Font = "Microsoft Sans Serif,10"
$btnBrowseImg.Add_Click({Get-Filename})
$Form.controls.Add($btnBrowseImg)


$form.Add_Shown({$form.Activate()})    
$dialogResult = $form.ShowDialog()