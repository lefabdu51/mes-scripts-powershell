Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Entrez votre nom")
$a = read-host "Entrez votre nom"
$speak.Speak("Entrez votre mot de passe")
$b = read-host "Entrez votre mot de passe"
# on récupère la liste des membres de la methode.
$test = $speak | Get-Member
# et on fait un rapport vocal
$speak.Speak($test)