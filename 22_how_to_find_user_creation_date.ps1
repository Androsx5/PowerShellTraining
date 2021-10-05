<#

.SYNOPSIS

Script che individua la data di creazione di un utente Windows

.DESCRIPTION

Viene usato il trick di individuare la data di creazione della cartella utente dentro C:\Users


#>

Get-ChildItem -Path C:\Users | Select-Object Name,CreationTime 