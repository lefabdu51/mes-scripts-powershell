write-host "ne fonctionne qu'avec des lettres de lecteurs réseaux sans \, ex: d:"
$d = read-host " disque à traiter"
$drive = Get-WmiObject -class Win32_LogicalDisk | where-object {$_.DeviceID -eq $d}
$freeGB = ($drive.FreeSpace/1024/1024/1024)
$freeGB = [math]::Round($freeGB,2)
write-host "Espace disque restant sur "  $d  " = "  $freeGB " GB"
# Ajouter smtp et credentials d'un compte windows à la fonction ci dessous pour envoyer le mail
# Voir get-help Send-MailMessage -examples pour la configuration
# Ce script peut être lancé via une tache planifiée pour surveiller l'espace disque disponible sur un système de fichiers.
# Il faut modifier la commande ci dessous afin d'avoir une seule demande des id lors de la première execution du script, puis un
# stockage des identifiants dans un fichier sous forme sécurisée. Si le fichier existe alors on utilise son contenu
# sinon on demande les identifiants et on le crée.
if (test-path -Path "id.txt")
{
$cred = (get-content -Path id.txt)
} else {
$cred = (Get-Credential)
Set-Content id.txt  $cred
}
Send-MailMessage -From "fabrice.witkowski@outlook.com" -To "fabrice.witkowski@gmail.com" -Subject "Espace disque restant" -Body "test email: Espace disque restant sur le disque :   $freeGB   GB" -SmtpServer "smtp.outlook.com"  -Credential $cred -UseSsl
    