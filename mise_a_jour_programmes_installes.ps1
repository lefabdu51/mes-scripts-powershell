$ListeProgrammes = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
$ListeProgrammesD = gp HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |Select DisplayName, DisplayVersion, Publisher, InstallDate, HelpLink, UninstallString
write-host "programmes"
write-host $ListeProgrammes
write-host "programmes bdr"
write-host $ListeProgrammesD