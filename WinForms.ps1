$form = New-Object System.Windows.Forms

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$form = New-Object System.Windows.Forms.Form

$form.show()

sleep 3000

$form.close()