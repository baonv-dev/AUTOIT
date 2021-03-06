; Run the winzip installer
#RequireAdmin
Run("winzip90.exe")

; Initial Setup Screen
WinWaitActive("WinZip® 9.0 SR-1 Setup", "&Setup")
Send("!s")

; Install location
WinWaitActive("WinZip Setup", "into the following folder")
Send("{ENTER}")

; Features overview
WinWaitActive("WinZip Setup", "WinZip features include")
Send("!n")

; License agreement
WinWaitActive("License Agreement")
Send("!y")

; Quick start
WinWaitActive("WinZip Setup", "Quick Start Guide")
Send("!n")

; Choose interface
WinWaitActive("WinZip Setup", "switch between the two interfaces")
Send("!c")
Send("!n")

; Installation type (custom/express)
WinWaitActive("WinZip Setup", "&Express setup (recommended)")
Send("!e")
Send("!n")

; Select file associations
WinWaitActive("WinZip Setup", "WinZip needs to associate itself with your archives")
Send("!n")

; Completed installation screen
WinWaitActive("WinZip Setup", "Thank you for installing this evaluation version")
Send("{TAB}")
Send("{TAB}")
Send("{ENTER}")

; Wait for winzip to load then close it
WinWaitActive("WinZip (Evaluation Version)")
WinClose("WinZip (Evaluation Version)")
ConsoleWrite("done")