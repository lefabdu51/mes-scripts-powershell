# recupérer la liste des utilitaires de resolution de problèmes 
# La liste utilisée pour ce script est celle disponible pour windows 10 oem. D'autres utilitaires peuvent être disponible sous d'autres versions
$liste = get-ChildItem -path "c:\Windows\Diagnostics\System" | Select-Object Name
# $SubFolders = Get-ChildItem -path "c:\Windows\Diagnostics\System" -Directory $($niveau-1).FullName
$liste = get-Childitem -Path "C:\Windows\diagnostics\System" -Directory
Write-Host "Liste des utilitaires: entrez le nom d'un utilitaire pour le lancer"
out-host -InputObject  $liste
$liste |Out-Host -Paging
$choix = Read-Host "Votre choix :"
Get-TroubleshootingPack -path $choix | Invoke-TroubleshootingPack
