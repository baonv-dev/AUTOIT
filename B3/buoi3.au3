#include <SQLite.au3>
#include <SQLite.dll.au3>
#include "WinHttp.au3"
#include "wd_core.au3"
#include "wd_helper.au3"

Local $sDesiredCapabilities, $iIndex, $sSession
Local $nMsg, $bProcess = False
Local $hQuery, $aRow, $aNames
SetupChrome();
_WD_Startup()

If @error <> $_WD_ERROR_Success Then
	Exit -1
EndIf
$sSession = _WD_CreateSession($sDesiredCapabilities)

If @error = $_WD_ERROR_Success Then
   _SQLite_Startup()
   _SQLite_Open("form.db")
   _SQLite_Query(-1, "SELECT * FROM tbl_form_info", $hQuery)
   _WD_Navigate($sSession, "http://localhost:8080/nukeviet/vi/contact/")
   _WD_LoadWait($sSession, 4000)
   While _SQLite_FetchData($hQuery, $aRow, False, False) = $SQLITE_OK
	  $ftitle = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@name='ftitle']")
	  $fname = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@name='fname']")
	  $femail = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@name='femail']")
	  $fphone = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@name='fphone']")
	  $faddress = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//input[@name='faddress']")
	  $fcon = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//textarea[@name='fcon']")
	  $sElement = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//div[@class='panel-body loadContactForm']")
	  $sElementSelector = "//input[@name='btsend']"
	  $sButton = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, $sElementSelector)
	  If @error = $_WD_ERROR_Success Then
		 _WD_ElementOptionSelect($sSession, $_WD_LOCATOR_ByXPath, "//select[@name='fcat']//option["&$aRow[1]&"]")
		 _WD_ElementAction($sSession, $ftitle, 'value', $aRow[2])
		 _WD_ElementAction($sSession, $fname, 'value', $aRow[3])
		 _WD_ElementAction($sSession, $femail, 'value', $aRow[4])
		 _WD_ElementAction($sSession, $fphone, 'value', $aRow[5])
		 _WD_ElementAction($sSession, $faddress, 'value', $aRow[6])
		 _WD_ElementAction($sSession, $fcon, 'value', $aRow[7])
		 _WD_ElementAction($sSession, $sButton, 'click')
		 $hasError = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, "//div[@class='form-group has-error']")
		 $input_error = _WD_ElementAction($sSession, $hasError, 'Text')
		 $text_error = "Không có lỗi";
		 If $hasError <> '' Then
			$ObjScreenShot = _WD_Screenshot($sSession, $sElement)
			$FileName = $input_error&'.png'
			$FilePath = FileOpen(@scriptdir&"/Screenshoot/"&'case_id_'&$aRow[0]&'_'&$FileName, 18)
			FileWrite($FilePath, $ObjScreenShot)
			FileClose($FilePath)
			$text_error = $input_error;
		 EndIf
		 $SQLUPDATESTRING = "UPDATE tbl_form_info SET status = " & _SQLite_Escape($text_error) & " WHERE id = " &$aRow[0]&";"
		 _SQLite_Exec(-1, $SQLUPDATESTRING)
		 Sleep(4000)
		 _WD_Action($sSession,"refresh")
	  EndIf
   WEnd
EndIf

_SQLite_QueryFinalize($hQuery)
_SQLite_Close()
_SQLite_Shutdown()
_WD_DeleteSession($sSession)
_WD_Shutdown()

Func SetupChrome()
	_WD_Option('Driver', 'chromedriver.exe')
	_WD_Option('Port', 9515)
	_WD_Option('DriverParams', '--verbose --log-path="' & @ScriptDir & '\chrome.log"')
	$sDesiredCapabilities = '{"capabilities": {"alwaysMatch": {"goog:chromeOptions": {"w3c": true, "excludeSwitches": [ "enable-automation"]}}}}'
 EndFunc   ;==>SetupChrome
