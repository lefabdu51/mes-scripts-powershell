# $path = "d:\bookmarks"
# $out  = "d:\bookmarks\booktotalcd .txt"
$path = read-host "repertoire contenant les fichiers"
$out = read-host "emplacement et nom du fichier de sortie "
$motif = read-host "motif de recherche"
$recurse = read-host " recherche des fichiers recursive ?"
if ($recurse -eq 'O' -or $recurse -eq 'O')
{
$recurse = '-Recurse'
} else {
$recurse = ''
} 
Get-ChildItem -Path $path  -Filter $motif $recurse | % {
       $file = $_.Name
       Get-Content $_.FullName | % {
           "${file}: $_" | Out-File -Append $out
       }
}
Get-Content $out |out-host -Paging