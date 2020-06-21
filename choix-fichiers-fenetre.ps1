# Choisir un fichier via une fentre graphique et recupérer le choix dans Powershell
$files = Get-ChildItem -Path C:\windows\diagnostics -File
$fileChoices = @()
for ($i=0; $i -lt $files.Count; $i++) {  
$fileChoices += [System.Management.Automation.Host.ChoiceDescription]("$($files[$i].Name)") }
$userChoice = $host.UI.PromptForChoice('Select File', 'Choose a file', $fileChoices, 0) + 1
# Affichage du résultat dans la console
Write-Host "Vous avez choisi $($files[$userChoice].FullName)"
