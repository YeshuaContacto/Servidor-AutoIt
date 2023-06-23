#include <MsgBoxConstants.au3>

iniciarGUI()

Func iniciarGUI()

TCPStartup() ;Iniciamos servicio tcp

OnAutoItExitRegister("OnAutoItExit")

;Asignamos una variable local que almacena la direccion de loopback

Local $sIPAddrees = "127.0.0.1"
Local $iPort	  = 65432

Local $accion = ""

##include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Networking - Cliente", 500, 290, 300, 200)
$btnCalc = GUICtrlCreateButton("Calculadora", 50, 30, 400, 50)
$btnBlock = GUICtrlCreateButton("Block de notas", 50, 90, 400, 50)
$btnPaint = GUICtrlCreateButton("Paint", 50, 150, 400, 50)
$btnSaludar = GUICtrlCreateButton("Saludar", 50, 210, 400, 50)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnCalc
			MyTCP_Client($sIPAddrees, $iPort, "Calculadora")
		Case $btnBlock
			MyTCP_Client($sIPAddrees, $iPort, "blockNotas")
		Case $btnPaint
			MyTCP_Client($sIPAddrees, $iPort, "paint")
		Case $btnSaludar
			MyTCP_Client($sIPAddrees, $iPort, "saludar")

	EndSwitch
WEnd
EndFunc ;Termina la funcion iniciarGUI()


Func MyTCP_Client($sIPAddrees, $iPort, $accion)
	Local $iSocket =TCPConnect($sIPAddrees, $iPort)
	Local $iError = 0

	;Checamos si podemos conectarnos a la IP y puertos definidos
	If @error Then
		MsgBox(0, "Error", "Servidor apagado o puerto cerrado")
		Return false
	EndIf

	;Accion elegida por el cliente y luego enviada al servidor para ser procesada
	Switch $accion
		Case "calculadora"
			TCPSend($iSocket, "calculadora")
		Case "blockNotas"
			TCPSend($iSocket, "blockNotas")
		Case "paint"
			TCPSend($iSocket, "paint")
		Case "saludar"
			TCPSend($iSocket, "Hola como te va, espero que muy bien!!!")

	EndSwitch

	;Manejo de errores
	If @error Then
		$iError = @error
		MsgBox(0, "Error", "No se pudo enviar datos, codigo de error: " & $iError)
	EndIf

	TCPCloseSocket($iSocket)

EndFunc ;Termina MyTCP_Client()

Func OnAutoItExit()
	TCPShutdown() ;Cerrar el servicio tcp

EndFunc




