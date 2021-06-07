$cred = Get-Credential

# la password è un oggetto di tipo SecureSting 
$cred.Password | ConvertFrom-SecureString

$uid = "asanter"

$pwd = "01000000d08c9ddf0115d1118c7a00c04fc297eb01000000e00df9985181374ba4d072447aa97ecc0000000002000000000010660000000100002000000013ab8be9734de35175e0679d51234bf055973c7dc0006097d4b50dc91c4a75b7000000000e8000000002000020000000675fc232058b39db36200c657ce4afb0f29f7dfe6490cb27cb7eb530d2087ece20000000b925f79f50d2a6eda2d436fbed995a0f8d8214c6d8a18b81119c53fd7bdf114c4000000079b835d0da133457fc39ed18741298c11c4370887849c43d80a52665a572c992f4f541d6a0659b5d3cbd20a359e6ad0cea0852298f6798cd58391c42fb085395"

$spwd = ConvertTo-SecureString $pwd

$clearpwd = [RunTime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($spwd))

$cred = New-Object System.Management.Automation.PSCredential ($uid,$spwd)

#vorrei stampare la data di domani

$d = Get-Date

[System.DateTime]::Now.AddDays(1).ToString("yyyy-MM-dd")