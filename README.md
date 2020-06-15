Ce dépot est un dépot pour avoir mes scripts Powershell accessible en ligne.
Les explications sur le contenu de ce dépot sont soit dans ce fichier, soit dans le script en lui même

# le script concatenation_fichiers
Ce script concatène différents fichiers correspondant à un motif de recherche dans un fichier unique.
Très utile pour concaténer des fichiers textes ou html ensemble.
Les fichiers doivent tous être dans le même répèrtoire . Le répèrtoire de sortie peut être nimporte ou.
Ce script ne nécessite pas d élévation de privilèges pour un utilisateur de base. 

# le script installation_chocolatey
ce script permet l'installation de chocolatey sur la machine ou il est éxécuté.
La commande choco est disponible suite à l'utilisation de ce script.
Ce script doit être lancé avec des droits administratifs.

# le script elevation_privilege
Ce script doit être copié au début d'un script devant être lancé avec des droits administrateur.
Il permet une élévation de privilèges et l' execution des commandes qui suivent celui ci.

# le script clef_windows
Ce script permet de récuperer la clef produit windows de la machine ou il est installé. Très utile si l'étiquette bleu ou verte 
est usée ou absente. Fonctionne sous Windows 10. 