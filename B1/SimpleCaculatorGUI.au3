#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

GUICreate("Calculator", 260, 260)
$idBtn1 = GUICtrlCreateButton("1", 54, 138, 36, 29)

; Digit's buttons
Local $idBtn0 = GUICtrlCreateButton("0", 54, 171, 36, 29)
Local $idBtn1 = GUICtrlCreateButton("1", 54, 138, 36, 29)
Local $idBtn2 = GUICtrlCreateButton("2", 93, 138, 36, 29)
Local $idBtn3 = GUICtrlCreateButton("3", 132, 138, 36, 29)
Local $idBtn4 = GUICtrlCreateButton("4", 54, 106, 36, 29)
Local $idBtn5 = GUICtrlCreateButton("5", 93, 106, 36, 29)
Local $idBtn6 = GUICtrlCreateButton("6", 132, 106, 36, 29)
Local $idBtn7 = GUICtrlCreateButton("7", 54, 73, 36, 29)
Local $idBtn8 = GUICtrlCreateButton("8", 93, 73, 36, 29)
Local $idBtn9 = GUICtrlCreateButton("9", 132, 73, 36, 29)
Local $idBtnPeriod = GUICtrlCreateButton(".", 132, 171, 36, 29)

; Memory's buttons
Local $idBtnMClear = GUICtrlCreateButton("MC", 8, 73, 36, 29)
Local $idBtnMRestore = GUICtrlCreateButton("MR", 8, 106, 36, 29)
Local $idBtnMStore = GUICtrlCreateButton("MS", 8, 138, 36, 29)
Local $idBtnMAdd = GUICtrlCreateButton("M+", 8, 171, 36, 29)

; Operators
Local $idBtnChangeSign = GUICtrlCreateButton("+/-", 93, 171, 36, 29)
Local $idBtnDivision = GUICtrlCreateButton("/", 171, 73, 36, 29)
Local $idBtnMultiplication = GUICtrlCreateButton("*", 171, 106, 36, 29)
Local $idBtnSubtract = GUICtrlCreateButton("-", 171, 138, 36, 29)
Local $idBtnAdd = GUICtrlCreateButton("+", 171, 171, 36, 29)
Local $idBtnAnswer = GUICtrlCreateButton("=", 210, 171, 36, 29)
Local $idBtnInverse = GUICtrlCreateButton("1/x", 210, 138, 36, 29)
Local $idBtnSqrt = GUICtrlCreateButton("Sqrt", 210, 73, 36, 29)
Local $idBtnPercentage = GUICtrlCreateButton("%", 210, 106, 36, 29)
Local $idBtnBackspace = GUICtrlCreateButton("Backspace", 54, 37, 63, 29)
Local $idBtnClearE = GUICtrlCreateButton("CE", 120, 37, 62, 29)
Local $idBtnClear = GUICtrlCreateButton("C", 185, 37, 62, 29)

Local $idEdtScreen = GUICtrlCreateEdit("0.", 8, 2, 239, 23, BitOR($ES_READONLY, $ES_RIGHT), $WS_EX_STATICEDGE)
Local $idLblMemory = GUICtrlCreateLabel("", 12, 39, 27, 26, $SS_SUNKEN)

GUISetState()

Local $msg
Do
   $msg = GUIGetMsg()
Until $msg = $GUI_EVENT_CLOSE





