write-host "ne fonctionne qu'avec des lettres réseaux sans \, ex: d:"
$d = read-host " disque à traiter"
$drive = Get-WmiObject -class Win32_LogicalDisk | where-object {$_.DeviceID -eq $d}
$freeGB = ($drive.FreeSpace/1024/1024/1024)
$freeGB = [math]::Round($freeGB,2)
"Espace disque restant sur " + $d + " = " + $freeGB + " GB"
# Ajouter smtp et credentials d'un compte windows à la fonction ci dessous pour envoyer le mail
# Voir get-help Send-MailMessage -examples pour la configuration
# Ce script peut être lancé via une tache planifiée pour surveiller l'espace disque disponible sur un système de fichiers.
# Send-MailMessage -From "user@domaine.fr" -To "admin@domaine.fr" -Subject "Espace disque restant" -Body "test email: Espace disque restant sur le disque :  + $freeGB +  GB" -SmtpServer "smtp.gmail.com"  -Credential domain01\admin01 -UseSsl
    