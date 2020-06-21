$ListeProgrammes = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
$ListeProgrammesD = gp HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |Select DisplayName, DisplayVersion, Publisher, InstallDate, HelpLink, UninstallString
function recup_fichier ($uri,$sortie)
{
#la fonction sert à récupérer les fichier de setup concernant la nouvelle / dernière version d'un logiciel.
#la commande à utiliser est invoke-webrequest, qui est un équivalent à wget sous linux.
# Recuperation d'un fichier setup
Invoke-WebRequest -Uri "$url" -OutFile "$sortie"
#doit recommencer en cas d'erreur et suivant l'erreur.
# si 404 afficher message suivant : ressources indisponible
# si 500  afficher message suivant : erreur serveur
# si 450:  afficher message suivant : erreur de droits
}
function test_existence_logiciel($ListeProgrammes,$ListeProgrammesD,$nom)
{
write-host $nom
# cette fonction sert à vérifier l'existence d'un logiciel, et à récupérer son numéro de version
if ('$ListeProgrammes' -match '$nom') {
	write-host "$nom" 
 write-host "est installé"
} elseif ("$ListeProgrammesD" -match "$nom") {
	write-host $nom 
write-host "est installé"
} else {
write-host $nom " est absent"
}
}
$nom = "CCleaner"
write-host $nom
test_existence_logiciel($ListeProgrammes,$ListeProgrammesD,$nom)
$nom = "filezilla"
write-host $nom
test_existence_logiciel($ListeProgrammes,$ListeProgrammesD,$nom)
$matches
$nom = "toto"
write-host $nom
test_existence_logiciel($ListeProgrammes,$ListeProgrammesD,$nom)
$matches