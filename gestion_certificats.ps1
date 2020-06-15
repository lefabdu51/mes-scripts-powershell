#+
# certificate.ps1
#
# All you ever wished to know about certificates, thanks to Dr Tobias Weltner's eBook
# "Mastering PowerShell" - http://powershell.com
# Following code is a tested compilation (Windows 7 PS 2.0) of pages 302 to 318 of the book.
#
# This script assumes that the Visual Studio V8 SDK be installed in
# c:\Program Files\Microsoft Visual Studio 8\SDK\v2.0
# so that utility makecert.exe will be found in \bin subfolder.
# Otherwise, find/put a makecert.exe image somewhere on your C: disk and change code below accordingly.
#
# v1.0-0 21-nov-2010 DTL Didier.morandi (at) gmail.com - http://www.scripting-errors.com
#-

# disable error handling
$erroractionpreference = "Stop"

""
"1° Let's see first what certificates we have already:"

"listing to the console window"

Dir cert: -Recurse -codeSigningCert
$dummy = Read-Host "<RET> to continue"

""
"Option dialog"

$Store = New-Object system.security.cryptography.X509Certificates.x509Store("My", "CurrentUser")
$store.Open("ReadOnly")
[System.Reflection.Assembly]::LoadWithPartialName("System.Security")
$certificate = [System.Security.Cryptography.x509Certificates.X509Certificate2UI]::`
  SelectFromCollection($store.certificates, "Your certificates", "Please select", 0)
$store.Close()
$certificate
$dummy = Read-Host "<RET> to continue"

""
"2° Creation of a self-signed certificate"

$name = "PowerShellTestCert"
pushd
Cd "$env:programfiles\Microsoft Visual Studio 8\SDK\v2.0\Bin"
.\makecert.exe -pe -r -n "CN=$name" -eku 1.3.6.1.5.5.7.3.3 -ss "my"
popd
$dummy = Read-Host "<RET> to continue"

""
"3° List created certificate"

$name = "PowerShellTestCert"
$certificate = Dir cert:\CurrentUser\My | Where-Object { $_.Subject -eq "CN=$name"}
$certificate
$dummy = Read-Host "<RET> to continue"

""
"4° Examine certificate"

# Call all code-signing certificates and store them in a field:
$certs = @(Dir cert:CurrentUser\My -codeSigningCert)
"{0} certificates were found." -f $certs.count
$dummy = Read-Host "<RET> to continue"

""
"5° Display certificate data"

# Show all the certificate data in a dialog box:
[System.Reflection.Assembly]::LoadWithPartialName("System.Security")
[System.Security.Cryptography.x509Certificates.X509Certificate2UI]::DisplayCertificate($certificate)
$dummy = Read-Host "<RET> to continue"

""
"6° Copy certificate in root certificate authorities store"

$Store = New-Object system.security.cryptography.X509Certificates.x509Store("root", "CurrentUser")
$Store.Open("ReadWrite")
$Store.Add($certificate)
$Store.Close()
$dummy = Read-Host "<RET> to continue"

""
"7° Check certificates store"

certmgr.msc
$dummy = Read-Host "<RET> to continue"

""
"8° use certificate to sign a PowerShell script"

' "Hello world" ' > test.ps1
$certificate = @(Dir cert:CurrentUser\My -codeSigningCert -recurse)[0]
Set-AuthenticodeSignature test.ps1 $certificate
$dummy = Read-Host "<RET> to continue"

""
"9° Use built-in certificates dialog box"

# Text for the dialog box:
$title = "Available identities"
$text = "Please select a certificate for signing"
# Find certificates:
$certificates = Dir cert:\ -recurse -codeSigningCert
# Load System.Security library and wrap
# certificates in a collection:
[System.Reflection.Assembly]::LoadWithPartialName("System.Security")
$collection = New-Object `
  System.Security.Cryptography.X509Certificates.X509Certificate2Collection
$certificates | ForEach-Object { $collection.Add($_) }
# Display options:
$certificate = [System.Security.Cryptography.x509Certificates.X509Certificate2UI]::`
  SelectFromCollection($collection, $title, $text, 0)
# Use selected certificate to sign
Set-AuthenticodeSignature -Certificate $certificate[0] -FilePath test.ps1
$dummy = Read-Host "<RET> to continue"

""
"10° Test validation of unsigned script"

' "Hello" ' > unsigned.ps1
$check = Get-AuthenticodeSignature unsigned.ps1
$check.StatusMessage
$dummy = Read-Host "<RET> to continue"

""
"11° List of scripts with (or without) valid certification"
# (should be executed in the directory where your .ps1 scripts are)

Get-AuthenticodeSignature (Dir *.ps1)
$dummy = Read-Host "<RET> to continue"

""
"12° perform some filtering"

Get-AuthenticodeSignature (Dir *.ps1) | Where-Object {(($_.Status -eq "HashMismatch") `
  -or ($_.Status -eq "UnknownError"))}
$dummy = Read-Host "<RET> to continue"

""
"13° sign script with trusted certificate"

$certificate = Dir cert:\CurrentUser\My | Where-Object { $_.Subject -eq "CN=PowerShellTestCert" }
Set-AuthenticodeSignature test1.ps1 $certificate
$dummy = Read-Host "<RET> to continue"

""
"14° Create a root certificate"
# (enter password used when you created your first root certificate)

$departmentname = "DTL Department"
pushd
Cd "$env:programfiles\Microsoft Visual Studio 8\SDK\v2.0\Bin"
.\makecert -n "CN=$departmentname" -a sha1 -eku 1.3.6.1.5.5.7.3.3 `
  -r -sv root.pvk root.cer -ss Root -sr localMachine
popd
$dummy = Read-Host "<RET> to continue"

""
"15° Check certificate"

$certificate = Dir cert:\LocalMachine\Root | Where-Object { $_.Subject -eq "CN=$departmentname" }
$certificate
$dummy = Read-Host "<RET> to continue"

""
"16° Creating staff certificates"

$staff = "Didier Morandi"
pushd
Cd "$env:programfiles\Microsoft Visual Studio 8\SDK\v2.0\Bin"
.\makecert -pe -n "CN=$staff" -ss MY -a sha1 -eku 1.3.6.1.5.5.7.3.3 -iv root.pvk -ic root.cer
popd
$dummy = Read-Host "<RET> to continue"

""
"17° Verify staff certificate"

$staff = "Didier Morandi"
$certificate = Dir cert:\CurrentUser\My | Where-Object { $_.Subject -eq "CN=$staff" }
[System.Reflection.Assembly]::LoadWithPartialName("System.Security")
[System.Security.Cryptography.x509Certificates.X509Certificate2UI]::DisplayCertificate($certificate)
$dummy = Read-Host "<RET> to continue"

""
"18° backup of staff certificate"

$filename = "$(get-location)\backup.pfx"
$pwd = "mumblefratz"
[System.Reflection.Assembly]::LoadWithPartialName("System.Security")
$collection = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection
$collection.Add($certificate)
$bytes = $collection.Export(3, $pwd)
$filestream = New-Object System.IO.FileStream($filename, "Create")
$filestream.Write($bytes, 0, $bytes.Length)
$filestream.Close()
$dummy = Read-Host "<RET> to continue"

""
"19° installing enterprise-wide root certificates"

copy "$env:programfiles\Microsoft Visual Studio 8\SDK\v2.0\Bin\root.cer" "root.cer"
$Store = New-Object system.security.cryptography.X509Certificates.x509Store("root", "LocalMachine")
$filename = "$(get-location)\root.cer"
$store.Open("ReadWrite")
$collection = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection
$collection.Import($filename)
$store.Add($collection[0])
$store.Close()
$dummy = Read-Host "<RET> to continue"

""
"20° Install certificate interactively"

.\root.cer

"That's all, Folks."