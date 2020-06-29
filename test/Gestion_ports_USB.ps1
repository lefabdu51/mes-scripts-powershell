If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path),"-ConfFile ",('"{0}"' -f $ConfFile) -Verb RunAs
}Else{
  Write-host "Privileges déja élevés"
}

set-location HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR
$val = get-ItemPropertyValue -name 'Start' -Path HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR
write-host $val
if ($val -eq 3) { write-host "ON active les ports" 
 set-itemProperty -path HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR -name Start -Value 4}
if ($val -eq 4) { write-host "on désactive les ports" 
set-itemProperty -path HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR -name Start -Value 3}
Restart-Computer