# $path = "d:\bookmarks"
# $out  = "d:\bookmarks\booktotalcd .txt"
write-host "les fichiers à concaténer doivent être dans le même dossier"
$path = read-host "repertoire contenant les fichiers"
$out = read-host "emplacement et nom du fichier de sortie "
$motif = read-host "motif de recherche" 
Get-ChildItem -Path $path  -Filter $motif | % {
       $file = $_.Name
       Get-Content $_.FullName | % {
           "${file}: $_" | Out-File -Append $out
       }
}
Get-Content $out |out-host -Paging