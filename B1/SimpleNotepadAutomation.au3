#include <MsgBoxConstants.au3>
Run("notepad.exe")
WinWaitActive("Untitled - Notepad")
Send("This is some text.")
$a = WinClose("Untitled - Notepad")
If WinClose("[CLASS:Notepad]", "") Then
   WinWaitActive("Notepad", "Save")
   Sleep(3000)
   Send("!n")
   MsgBox($MB_ICONINFORMATION, "", "Window closed")
Else
   MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Error", "Window not Found")
EndIf