$files = Get-ChildItem -Path d:\txt -File
$fileChoices = @()
for ($i=0; $i -lt $files.Count; $i++) {  $fileChoices += [System.Management.Automation.Host.ChoiceDescription]("$($files[$i].Name)") }
$userChoice = $host.UI.PromptForChoice('Select File', 'Choose a file', $fileChoices, 0) + 1
# affichage de la réponse
 Write-Host "Vous avez choisi $($files[$userChoice].FullName)"
# affichage du contenu du fichier dans la console
 get-content $($files[$userChoice].FullName)
# affichage du contenu du fichier dans une fenetre graphique
# Les 3 instructions ci dessous s'affichent dans la console
# $var =  get-content $($files[$userChoice].FullName)
# $host.UI.Write($var)
#$var | out-host 
#Afficher la version de Powershell : write-host $host.Version