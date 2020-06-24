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

# le script elevation_privileges
Ce script doit être copié au début d'un script devant être lancé avec des droits administrateur.
Il permet une élévation de privilèges et l' execution des commandes qui suivent celui ci.

# le script clef_windows
Ce script permet de récuperer la clef produit windows de la machine ou il est installé. Très utile si l'étiquette bleu ou verte 
est usée ou absente. Fonctionne sous Windows 10. 

# le script Gestion_ports_USB
Ce script est un script permettant de désactiver les ports usb de la machine sur laquelle il est éxécuté.
Une seconde utilisation remet les ports USB dans l'état précédent.
Ce script agit sur une clef de la base de registre.

# le script utilitaires-depannage-windows
Ce script permet de lancer les differents utilitaires de résolution de problèmes intégrés à Windows. Les noms des utilitaires
doivent réspecter la même casse qu'indiquée dans la liste. Cette liste peut varier selon la version de Windows sur laquelle
ce script est lancé.

# le script scan_ports
Ce script est un scanner de ports. Il est basique, mais utile si on a pas nmap sous la main.
Les variables sont en debut de script et à modifier.

# Le script tri_dossier
Ce script permet de trier un répèrtoire. On peut choisir entre entrer le chemin du dossier et entrer 1 pour trier le bureau.
Le tri se fait en fonction de l'extension des fichiers.

# le script affichage_groupe_utilisateur
Ce script affiche les groupes locaux auquel est associé l'utilisateur dont le nom est entré.
Deux type de sorties sont disponible: la propriété Name de l'objet localgroup, ou un affichage via write-output, qui 
affiche les groupes et leur description.
Ce script peut être intégré dans un autre script et travailler avec des variables et des groupes distant.

# le script selection_fichiers_dossier
Ce script permet de selectionner un fichier dans une arborescence de fichier. Chaque fichier est listé avec un numéro. 
En entrant ce numéro, on récuperes le nom de fichier dans une variable, qui peut être réutilisée après.

# le script espace_disque_restant
Ce script calcule l'espace disque restant sur un lecteur au sens Windows du terme. Il peut s'agir d'un disque ou une partition.
La commande send-MailMessage doit être personnalisée pour que l'email parte.
La commande write-host juste au dessus du dernier bloc de commentaires est la pour afficher le résultat du script. 
Ce scipt peut être lançé cycliquement via une tâche planifiée pour surveiller un disque ou un ensemble de disques précis (en dupliquant la ligne 3 à 7 et en fixant 
la valeur de $d directement dans le script. Dans le script actuel, il s'agit d'une entrée utilisateur.