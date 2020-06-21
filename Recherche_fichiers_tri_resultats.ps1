#Ici on écrit dans un fichier la liste des fichiers ainsi que le chemin du répertoire qui le contient
#Lien vers le fichier : cliquez ici
$RepertorieaTraiter = "D:\txt"
$currentScriptName = $MyInvocation.MyCommand.Name
#Récupération du nom du script en cours
#On ne prend que le nom du script sans l'extention. Pour cela on chercher la position d'un point en partant de la dro 
$currentScriptName = $currentScriptName.substring(0,$($currentScriptName.lastindexofany(".")))
#Création du fichier vierge 
$EmplacementFichier = "$varCheminRepertoireScript\$($currentScriptName)_Result.txt" 
$MonFichier = New-Item  -type file $EmplacementFichier  -Force Force
$MesObjets = get-childitem $RepertorieaTraiter  -Recurse
#get-childitem "C:\" -Recurse 
foreach ($UneLigne in $MesObjets){
#liste des sorties à trier 
#$UneLigne |gm 
$UneLigne |gm        
Write-Host "$($UneLigne.Name), $($UneLigne.FullName), $($UneLigne.PSParentPath)" 
#Write-Host "$($UneLigne.Name), $($UneLigne.FullName), $($UneLigne.PSParentPath)"        
Write-Host $UneLigne.FullName 
#Write-Host $UneLigne.FullName        
$MyLine = "$($UneLigne.Name)`t$($UneLigne.FullName)"
#`t$($UneLigne.PSParentPath)" #`t$($UneLigne.PSParentPath)"
# mettre une boucle if !empty pour eviter que le chemin soit vide        
add-content -path $MonFichier  $MyLine
} 