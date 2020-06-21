
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path),"-ConfFile ",('"{0}"' -f $ConfFile) -Verb RunAs
Write-host "Elevation des privilèges éffectuée"
}Else{
  Write-host "Privileges déja élevés"
}

