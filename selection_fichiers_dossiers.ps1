# selection d'un élément dans une liste de dossiers et fichiers
# commande de base get-childitem
# demande si la liste du contenu doit être récursive ou non
# demande le chemin de base pour la recherche
# a tester pour lignes contenu fichier txt
$recurse = read-host "recherche récursive: entrez 1"
$chemin = read-host "chemin de base pour la recherche de contenu"
if ($recurse -eq 1) {
$locations = get-childitem -path $chemin -recurse
} else {
$locations = get-childitem -path $chemin
} 
function Show-Menu {

    Param(

        [String[]]$Locations

    )

    do { 
    
        Write-Host "Merci d'effectuer une selection"

        $index = 1
        foreach ($location in $locations) {
    
            Write-Host "[$index] $location"
            $index++

        }
    
        $Selection = Read-Host 

    } until ($Locations[$selection-1])


    Write-Verbose "Vous avez séléctionné $($Locations[$selection-1])" -Verbose

    $Locations[$selection-1]
# test pour récuperer le type de variable
# $reponse = write-host $Locations[$selection-1].getType()
}

$Selection = Show-Menu -Locations $locations
