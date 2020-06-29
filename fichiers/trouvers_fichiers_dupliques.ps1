 Function Find-DuplicateName {  
$Input | ForEach-Object {  
  if ($lookup.ContainsKey($_.Name))    {   
  ‘{0} ({1}) already exists in {2}.’ -f $_.Name, $_.FullName, $lookup.$($_.Name) 
  }    else    {    
  $lookup.Add($_.Name, $_.FullName)  
  } 
  }  
 } 
$requete = Read-Host " Racine de la recherche "
$demande = read-Host " sortie fichier = 1, sortie ecran = 0"
 $lookup = @{}
 if ($demande -eq 0) 
 {
Get-ChildItem $requete -Recurse | Find-DuplicateName
 } elseif ($demande -eq 1) {
$sortie = Read-Host "Fichier de sortie"
Get-ChildItem $requete -Recurse | Find-DuplicateName >> $sortie 
} else {
write-host " réponse invalide "
}
# affichage de la liste à l'écran
# get-content $sortie | out-host -Paging