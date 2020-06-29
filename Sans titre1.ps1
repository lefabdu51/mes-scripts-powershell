Add-Type -AssemblyName System.Drawing
Cd d:\Perso\imgz\008

$Result=Dir *.jpg,*.png -PipelineVariable CurrentFile |
Foreach-Object {
    #ici l'usage du foreach permet d'adresser le scope de la variable CurrentFile
 Add-Member -InputObject $CurrentFile  -MemberType NoteProperty -Name (Test-ValidImageFormat $CurrentFile) -Value $state -PassThru
}

$Result|
 Where-Object {  -not $_.isValidFormat }|
 Select-Object -ExpandProperty Fullname