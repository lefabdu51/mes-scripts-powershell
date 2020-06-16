# Script permettant la gestion des droits et permissions d'un utilisateur 
# Peut être complexifié pour definir la politique completeavec 3 variables dans $ar 
# et en choisissant le dossier ou le ou les fichiers visés par la politique de droits

$list = "fabrice","Administrateurs"
foreach ($user in $list){
$folder = "d:\txt"
$acl = Get-Acl -Path $folder
$ar = New-Object system.security.accesscontrol.filesystemaccessrule($user,"FullControl","Allow")
$acl.SetAccessRule($ar)
Set-Acl -Path $folder $acl
}