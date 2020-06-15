# Permet d'écrire une liste des dossiers et fichier d'une arborescence
# dans un fichier csv norme excel
# les inscriptions write-host et get-content ne sont la que pour vérification du fichier et de son contenu 
$StartFolder = "D:\"
$Output = "d:\test-d.csv"
$fso = New-Object -COM 'Scripting.FileSystemObject'

$folders = @($StartFolder)
$folders += Get-ChildItem $StartFolder -Recurse -Force |
               Where-Object { $_.PSIsContainer } |
               Select-Object -Expand FullName

$folders |
       Select-Object @{n='Path';e={$_}}, @{n='Size';e={$fso.GetFolder($_).Size}} |
       Export-Csv $Output -Delimiter '|' -NoType
write-host "fichier de sortie"
write-host $Output
write-host "contenu du fichier de sortie sous la forme Fichier ou Répèrtoire | Taille"
get-content $Output