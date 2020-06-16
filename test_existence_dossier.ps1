If ((Test-Path -path "c:\Users"))
{
 $local = 'c:\Users'
 } else {
 $local = 'c:\Utilisateurs'
 }
 write-host $local