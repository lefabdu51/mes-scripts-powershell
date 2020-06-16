Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Entrez votre nom")
$a = read-host "Entrez votre nom"
$speak.Speak("Entrez votre mot de passe")
$b = read-host "Entrez votre mot de passe"