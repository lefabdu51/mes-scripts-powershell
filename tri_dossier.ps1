$chemin = read-host "Tri du bureau = 1, ou entrez le chemin du dossier à trier "
$recurse = read-host "recherche recursive = 1"
If ($chemin -eq 1) {
$files = Get-ChildItem -Path $pathToUse -Recurse
} else {
$files = Get-ChildItem -Path $pathToUse 
}
# on teste le chemin pour savoir si les chemins sont en anglais ou en français
If ($chemin -eq 1) {
If ((Test-Path -path "c:\Users"))
{
 $local = 'c:\Users'
 } else {
 $local = 'c:\Utilisateurs'
 }
 if ((Test-Path -path "$local\$env:username\Bureau"))
{
$pathToUse = "$local\$env:username\Bureau"
} else {
$pathToUse = "$local\$env:username\Desktop"
}
} else {
$pathToUse = $chemin
}
# On crées des tableaux le nom des tableaux est le nom du dossier ou sont stockés les fichiers correspondant aux extensions.
$video = @(
'3g2','3gp','3gpp','asf','avi','divx','f4v',
'flv','h264','ifo','m2ts','m4v','mkv','mod','mov',
'mp4','mpeg','mpg','mswmm','mts','mxf','ogv','rm',
'srt','swf','ts','vep','vob','webm','wlmp','wmv'
)
$feuilles_calcul = @(
'csv','ods','xls','xlsx'
)
$images = @(
'arw','bmp','cr2','crw','dcm','dds','djvu','djvu',
'dmg','dng','fpx','gif','ico','ithmb','jp2','jpeg',
'jpg','nef','nrw','orf','pcd','pict','png','psd',
'sfw','tga','tif','tiff','webp','xcf'
)
$presentations = @(
'key','odp','pps','ppsx''ppt','pptm','pptx'
)
$docs = @(
'doc','docm','docx','dot','dotx','eml','eps',
'hwp','odt','pages','pub','rtf',
'sxw','wpd',' wps','xml','xps'
)
$cadFiles = @(
'dwg','dxf','cxf'
)
$misc = @(
'bin','cda','dat','dll','isc',
'img','inf','ipa','kmz','pes',
'ps','rem','torrent','ttf'
)
$ebooks = @(
'azw','azw3','epub','fb2''lit','lrf','mbp','mobi',
'opf','prc'
)
$web = @(
'css','htm','html','js','json','php'
)
$arcs = @(
'7z','apk','bz2','gz','gzip','jar','rar',
'tar','tgz','zip','war'
)
$scripts = @(
'bat','cmd','vb','vbs','vbe','js',
'jse','ws','wsf','wsc','wsh','ps1',
'ps1xml','ps2','ps2xml','psc1','psc2'
)
$execs = @(
'exe','cab','msi'
)
$music = @(
'ogg','mp3','wav','m3u','xspf'
)
$contacts = @(
'vcf','contact','pst','ost','nst'
)
$sql = @(
'sql'
)
$textes = @(
'txt'
)
$log = @(
'log'
)
$comics = @(
'cbz','cbr'
)
$liens = @(
'lnk'
)
$pdf = @(
'pdf'
)
$aide = @(
'chm','hlp'
)
$isos = @(
'iso','img','wim','dmg','bin','cue','vcd','nrg'
)
# $files = Get-ChildItem -Path $pathToUse 
Foreach ($x in $files){
if($docs.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Documents" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Documents"
}
elseif($spreadsheets.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Feuilles de calcul" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Feuilles de calcul"
}
elseif($images.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Images" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Images"
}
elseif($presentations.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Presentations" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Presentations"
}
elseif($video.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Videos" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Videos"
}
elseif($cadFiles.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "CAD Files" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"CAD Files"
}
elseif($misc.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Divers" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Divers"
}
elseif($ebooks.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "E-Books" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"E-Books"
}
elseif($web.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Web" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Web"
}
elseif($arcs.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Archives" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Archives"
}
elseif($scripts.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Scripts" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Scripts"
}
elseif($music.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Audio" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Audio"
}
elseif($execs.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Executables" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Executables"
}
elseif($contacts.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Contacts - Outlook" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Contacts - Outlook"
}
elseif($sql.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "SQL" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"SQL"
}
elseif($textes.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Textes" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Textes"
}
elseif($log.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Logs" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Logs"
}
elseif($comics.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Comics" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Comics"
}
elseif($liens.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Liens" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Liens"
}
elseif($pdf.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "PDF" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"PDF"
}
elseif($aide.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "Aide" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Aide"
}
elseif($isos.Contains($x.Extension.TrimStart('.').ToLower())){
New-Item -ItemType Directory -Path $pathToUse -Name "ISOS" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"ISOS"
}
elseif($x.Directory){
New-Item -ItemType Directory -Path $pathToUse -Name "Autres - Divers" -ErrorAction Ignore
Move-Item -Path $x.FullName -Destination $pathToUse/"Autres - Divers"
}
else{
Write-Host $x
}
}