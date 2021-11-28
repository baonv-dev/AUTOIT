#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <IE.au3>
;~ Câu 1 Đề bài lấy tất cả link trong vinades.vn check live or die lưu vào csdl

Local $oIE = _IECreate("https://vinades.vn", 0, 0)
Local $hQuery, $aRow, $aNames
_SQLite_Startup()
_SQLite_Open("link.db")
_SQLite_Query(-1, "SELECT * FROM tbl_link", $hQuery)
_SQLite_FetchNames($hQuery, $aNames)

$oLinks = _IELinkGetCollection($oIE)
;~ Local $oInputs = _IEBodyReadText($oIE)
;~ Local $aResult = StringRegExp($oInputs, '(NukeViet)', $STR_REGEXPARRAYMATCH)

;~ Hiển thị tên bảng
;~ ConsoleWrite(StringFormat(" %-10d  %-25s  %-10d", $aNames[0], $aNames[1], $aNames[2]) & @CRLF)
;~ Hiển thị dữ liệu trong bảng
;~ While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK ; Read Out the next Row
;~    ConsoleWrite(StringFormat(" %-10d  %-25s  %-10d", $aRow[0], $aRow[1], $aRow[2]) & @CRLF)
;~ WEnd

$success = 0
$all = 0
For $oLink In $oLinks
   $check = _IECreate($oLink.href, 0, 0)
   $text_html = _IEBodyReadText($check)
   $result = StringRegExp($text_html, '(NukeViet)', $STR_REGEXPARRAYMATCH)
   $status = 0

   If Not @error Then
	  $url = _IEPropertyGet($check, "locationurl")
	  If $url = $oLink.href Then
		 $status = 1
	  EndIf
   EndIf
   ConsoleWrite($oLink.href&"-"&$status&@CRLF)
   $_ex = _SQLite_Exec(-1, "INSERT INTO tbl_link VALUEs (NULL," & _SQLite_Escape($oLink.href) & ", "& $status &");")
   If $_ex = $SQLITE_OK Then
	  $success += 1
   EndIf

   $all += 1
   _IEQuit($check)
   ;~ Avoid DDOS
   Sleep(10000)
Next

ConsoleWrite("done: "&$success&"/"&all)
_IEQuit($oIE)
_SQLite_QueryFinalize($hQuery)
_SQLite_Close()
_SQLite_Shutdown()
Exit