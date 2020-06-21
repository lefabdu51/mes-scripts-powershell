 $chemin = read-Host " chemin à purger :"
$nj = read-host " supprimer les fichiers ayant n jours d'ancienneté (indiquez n):"
if ($nj -gt 0)
{
$nj = -$nj
}
# On verifies la sortie
 write-host $nj
Get-ChildItem –Path $chemin -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays($nj))} | Remove-Item
