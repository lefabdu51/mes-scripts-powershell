Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Speak("Je donne ma langue au chat")
$speak.GetInstalledVoices().VoiceInfo
