# Variables, change these.
# $gpg_r = "me@here.com"
# $gpg_prog = "${env:ProgramFiles(x86)}" + "\GNU\GnuPG\pub\gpg2.exe"
# $destination = "C:\Users\nick\DropOneDriveBox\encrypted\"
# gpg --output doc.gpg --encrypt --recipient blake@cyb.org doc
# gpg --output --passphrase --decrypt 
# gpg --output -passphrase --decrypt 
# simple gpg wrapper
function gpg_me {
  $in_file = $args[0]
  $out_file = $args[1]
  Write-Host $in_file " | " $out_file
  & $gpg_prog --yes -e -r $gpg_r -o $out_file $in_file
}

# Loop thru current directory.
# $items = Get-ChildItem -Path ".\"
foreach ($item in $items)
{
      # if the item is NOT a directory, then process it.
      if ($item.Attributes -ne "Directory") {
        $thepath =  $destination + $item.Name + ".gpg"
          If (Test-Path $thepath){
            # // File exists
            $ThisDate = $item.LastWriteTime
            $OtherDate = (Get-ChildItem -Path $thepath).LastWriteTime
            #Write-Host $item.Name " - This:" $ThisDate "Other:" $OtherDate
            If ( $ThisDate -gt $OtherDate) {
              Write-Host $item.Name "Needs updating.."
              gpg_me $item.Name $thepath
            }
          }Else{
            # // File does not exist
            Write-Host "Encrypting New File "  $item.Name
            gpg_me $item.Name $thepath
          }

      }
}