$ErrorActionPreference = "silentlycontinue"
Get-ChildItem -Path "D:\Nextcloud\perso\Videos" -Recurse  | %{Write-host $_.FullName}