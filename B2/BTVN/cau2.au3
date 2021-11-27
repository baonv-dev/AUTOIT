#include <IE.au3>
;~ Đề bài : Tự động nhập form trong https://vinades.vn/vi/contact/ và submit
Local $oIE = _IECreate("https://vinades.vn/vi/contact/")
WinSetState("Liên hệ - Internet Explorer","",@SW_MAXIMIZE)
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oTitle = _IEFormElementGetCollection($oForm, 1)
Local $oName = _IEFormElementGetCollection($oForm, 2)
Local $oEmail = _IEFormElementGetCollection($oForm, 3)
Local $oPhoneNumber = _IEFormElementGetCollection($oForm, 4)
Local $oAddress = _IEFormElementGetCollection($oForm, 5)
Local $oContent = _IEFormElementGetCollection($oForm, 6)

_IELoadWait($oIE)
_IEFormElementSetValue($oTitle, "Test AutoIT")
_IEFormElementSetValue($oName, "Nguyễn Văn Bảo")
_IEFormElementSetValue($oEmail, "Baonguyen091099@gmail.com")
_IEFormElementSetValue($oPhoneNumber, "0987654321")
_IEFormElementSetValue($oAddress, "Bắc Giang")
_IEFormElementSetValue($oContent, "Nội Dung")
Sleep(2000)

;~ Random Mouse Move Pass Captcha
MouseMove( Random(50, 100),  Random(1, 150))
Sleep(2000)
MouseMove( Random(50, 200),  Random(1, 250))
Sleep(2000)
MouseMove( Random(50, 300),  Random(1, 350))
Sleep(5000)
MouseMove( Random(50, 400),  Random(1, 450))

;~ Click Position Captcha Screen Full HD
MouseClick($MOUSE_CLICK_LEFT, 917, 872, 1)
Sleep(5000)
_IEFormSubmit($oForm)
_IEQuit($oIE)
MsgBox(0, "Submit form", "Xong")
