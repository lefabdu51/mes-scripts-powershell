 Function Find-DuplicateName {  
$Input | ForEach-Object {  
  if ($lookup.ContainsKey($_.Name))    {   
  ‘{0} ({1}) already exists in {2}.’ -f $_.Name, $_.FullName, $lookup.$($_.Name) 
  }    else    {    
  $lookup.Add($_.Name, $_.FullName)  
  } 
  }  
 }
 
 $lookup = @{}
Get-ChildItem $home | Find-DuplicateName 
Get-ChildItem $env:windir | Find-DuplicateName 
Get-ChildItem $env:windir\system32 | Find-DuplicateName
