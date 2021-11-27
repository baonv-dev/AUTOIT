#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <MsgBoxConstants.au3>
;~ Mở IE
Local $hQuery, $aRow, $aNames
_SQLite_Startup()
; Hiển thị phiên bản
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open("buoi2.db") ; open :memory: Database

;~ $_ex = _SQLite_Exec(-1, "INSERT INTO bang1 VALUEs (12, 'http://nukeviet.vn', 0);")
;~ if $_ex = $SQLITE_OK then
;~    $LastInsertID = _SQLite_LastInsertRowID();
;~    ConsoleWrite("_SQLite_LastInsertRowID = "&$LastInsertID& @CRLF)
;~ EndIf

_SQLite_Query(-1, "SELECT * FROM bang1", $hQuery)
_SQLite_FetchNames($hQuery, $aNames)
;~ Hiển thị tên bảng
ConsoleWrite(StringFormat(" %-10d  %-25s  %-10d", $aNames[0], $aNames[1], $aNames[2]) & @CRLF)

;~ Hiển thị dữ liệu trong bảng
While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
   ConsoleWrite(StringFormat(" %-10d  %-25s  %-10d", $aRow[0], $aRow[1], $aRow[2]) & @CRLF)
WEnd
;~ MsgBox($MB_SYSTEMMODAL, "_SQLite_LastInsertRowID()", _SQLite_LastInsertRowID())

_SQLite_QueryFinalize($hQuery)
_SQLite_Close()
_SQLite_Shutdown()