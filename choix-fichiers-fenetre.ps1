# Choisir un fichier via une fenètre graphique et recupérer le choix dans Powershell
$files = Get-ChildItem -Path C:\Windows\diagnostics -File -Recurse
$fileChoices = @()
for ($i=0; $i -lt $files.Count; $i++) {  
$fileChoices += [System.Management.Automation.Host.ChoiceDescription]("$($files[$i].Name)") }
$userChoice = $host.UI.PromptForChoice('Select File', 'Choose a file',  $fileChoices , 0) + 1
# Affichage du résultat dans la console
# On peut utiliser le résultat dans une autre fonction ou un script. Ce script est un exemple
# et peut être recopié pour être utilisé dans d'autres scripts. 
Write-Host "Vous avez choisi $($files[$userChoice].FullName)"
