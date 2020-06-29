If (Wscript.Arguments.Count = 0) Then
strComputer = inputbox("Entrez le nom de l ordinateur dont vous voulez la clé","Nom de l ordinateur")
if (strComputer = "") then wscript.quit
Else
strComputer = Wscript.Arguments.Item(0)
End If
Dim Digits (24)
Digits (0) = "B" : Digits (1) = "C": Digits (2) = "D": Digits (3) = "F":
Digits (4) = "G": Digits (5) = "H": Digits (6) = "J": Digits (7) = "K":
Digits (8) = "M": Digits (9) = "P": Digits (10) = "Q": Digits (11) = "R":
Digits (12) = "T": Digits (13) = "V": Digits (14) = "W": Digits (15) = "X":
Digits (16) = "Y": Digits (17) = "2": Digits (18) = "3": Digits (19) = "4":
Digits (20) = "6" : Digits (21) = "7" : Digits (22) = "8": Digits (23) = "9"
Dim HexBuf (100), HexDigitalPID (15)
Set objReg = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\default:StdRegProv")
objReg.GetBinaryValue &H80000002, "SOFTWARE\Microsoft\Windows NT\CurrentVersion\", "DigitalProductId", HexBuf
StartOffset = 52 : EndOffset =67
For i = StartOffset to EndOffset
HexDigitalPID (i-StartOffset) = HexBuf(i)
next
# Convertit la clé produit codée en clé d activation
dLen = 29 : sLen = 15
KEYSTRING =""
for i=dLen-1 to 0 step -1
if ((i + 1) mod 6) = 0 then
KEYSTRING = KEYSTRING & "-"
else
HN = 0
For N = (sLen -1) to 0 step -1
Value = ( (HN *2^8 ) Or HexDigitalPID (N))
HexDigitalPID (N) = Value \ 24
HN = (Value mod 24)
next
KEYSTRING = KEYSTRING & Digits(HN)
end if
next
KEYSTRING2 = StrReverse (KEYSTRING)
WScript.Echo KEYSTRING2