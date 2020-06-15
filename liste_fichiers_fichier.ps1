$ErrorActionPreference = "silentlycontinue"
 Get-ChildItem -Path "D:\Nextcloud\perso\videos" -Recurse -File  | %{ADD-content -path "D:\Nextcloud\perso\liste_fichiers.txt" -value $_.FullName}