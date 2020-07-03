# connaitre touts les groupes auquels est associé un utilisateur
$membre = read-host "nom de l'utilisateur"
foreach ($LocalGroup in Get-LocalGroup)
{
if (Get-LocalGroupMember $LocalGroup -Member $membre –ErrorAction SilentlyContinue)
{
#affichage du nom du groupe
# $LocalGroup.Name
# ou affichage du nom du groupe et sa description
write-output $LocalGroup
}
}