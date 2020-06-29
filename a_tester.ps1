Import-Module GnuPG
$EncryptionTarget = "$($env:USERPROFILE)\Documents\Files-ToEncrypt"
$Passphrase = "MakeAVeryLongSecurePhrase"
Add-Encryption $EncryptionTarget -Password $Passphrase
Start-Sleep -Seconds 60
$EcnryptedFiles = Get-ChildItem $EncryptionTarget | Where-Object $_.Name -like "*.gpg"
foreach ($gpg in $EcnryptedFiles){
  Move-Item -Path $gpg.FullName -Destination "$($env:USERPROFILE)\Documents\$($gpg.Name)"
}
$UnEncryptedFiles = Get-ChildItem $EncryptionTarget | Where-Object $_.Name -notlike "*.gpg"
foreach ($nongpg in $UnEcnryptedFiles){
  Remove-Item -Path $nongpg.FullName -Confirm $false
}