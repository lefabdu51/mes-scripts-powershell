# article d'ou viennent le code qui m a servi de base. https://4sysops.com/archives/encrypt-and-decrypt-files-with-powershell-and-pgp/
# on télécharge et on installe gnupg silencieusement
function install_gpg {
$uri = 'https://raw.githubusercontent.com/adbertram/Random-PowerShell-Work/master/Security/GnuPg.psm1'
$moduleFolderPath = 'C:\Program Files\WindowsPowerShell\Modules\GnuPg'
$null = New-Item -Path $moduleFolderPath -Type Directory
Invoke-WebRequest -Uri $uri -OutFile (Join-Path -Path $moduleFolderPath -ChildPath 'GnuPg.psm1')
}
# on affiches les commandes disponibles
function affichage_cmd {
get-command -Module gnupg
}
# Code à rajouter au module de base gnuPg.psm1 pour faire reconnaitre les chemins
# utile si vous avez l'erreur ci dessous :
# Remove-Encryption : Impossible d’exécuter cette commande en raison de l’erreur : Le fichier spécifié est introuvable.
# Au caractère Ligne:1 : 2
# utiliser remove-module et import-module pour reimporter le nouveau script
# process {
#         try {
#             Get-ChildItem -Path $FolderPath -Filter '*.gpg' | foreach {
#                 $decryptFilePath = $_.FullName.TrimEnd('.gpg')
#                 Write-Verbose -Message "Decrypting [$($_.FullName)] to [$($decryptFilePath)]"
#                 & $GpgPath --batch --yes --passphrase $Password -o $decryptFilePath -d $_.FullName
#             }
#             Get-ChildItem -Path $FolderPath | where {$_.Extension -ne 'gpg'}
#         } catch {
#             Write-Error $_.Exception.Message
#         }
#     }
# on crypte avec cette commande
# Add-Encryption -FolderPath C:\ImportantFiles\ -Password 'secret'
# on decrypte avec cette commande
# Remove-Encryption -FolderPath C:\ImportantFiles\ -Password secret
# Si plusieurs fichiers à décrypter utiliser la commande ci dessous
# Get-ChildItem -Path '\\NDH2CPRW2FSR001\ftp\Tallahassee\Hold\*gpg' | ForEach-Object -Process {Remove-Encryption -FolderPath $PSItem.FullName -Password secret}
