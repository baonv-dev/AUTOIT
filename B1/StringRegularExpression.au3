#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

; Find test in text. The message box should read "0", which means the pattern "test" was not found in the test string "text".
ConsoleWrite("Test in Text: "&StringRegExp("text", 'test')&@CRLF)
;  match "s" OR "x", so we can use a set as a substitute: "[sx]" means match an "s" or an "x". Then the last letter is a "t" again.
ConsoleWrite("Text match an 's' or an 'x': "&StringRegExp("text", 'te[sx]t')&@CRLF)
ConsoleWrite("Test match an 's' or an 'x': "&StringRegExp("test", 'te[sx]t')&@CRLF)

;You can also specify how many times to match each character by using "{number of matches}" or you can specify a range by using "{min, max}".
ConsoleWrite("t-1 e-1 [sx]-1 t-1 in string 'test': "&StringRegExp("test", 't{1}e{1}[sx]{1}t{1}')&@CRLF)
ConsoleWrite("b repeat 4 in string aaaabbbbcccc: "&StringRegExp("aaaabbbbcccc", 'b{4}')&@CRLF)


Local $aResult = StringRegExp("This is a test example", '(test)', $STR_REGEXPARRAYMATCH)
If Not @error Then
    MsgBox($MB_OK, "SRE Example 4 Result", $aResult[0])
EndIf

$aResult = StringRegExp("This is a test example", '(te)(st)', $STR_REGEXPARRAYMATCH)
If Not @error Then
    MsgBox($MB_OK, "SRE Example 4 Result", $aResult[0] & "," & $aResult[1])
EndIf

Local $aResult = StringRegExp("There were 18 sheets left in the ream of paper.", _
        '([0-9]{1,3})', $STR_REGEXPARRAYMATCH)
If Not @error Then
    MsgBox($MB_OK, "SRE Example 5 Result", $aResult[0])
EndIf

Local $aResult = StringRegExp("You used 36 of 279 pages.", '([0-9]{1,3})(?: pages)', $STR_REGEXPARRAYMATCH)
If Not @error Then
    MsgBox($MB_OK, "SRE Example 6 Result", $aResult[0])
EndIf