#include <MsgBoxConstants.au3>
#include <Process.au3>

inicialGUI()

Func inicialGUI()

;inicializamos servicio tcp
TCPStartup()

;si termina de ejecutarse el codigo hacemos lo siguiente:
OnAutoItExitRegister("OnAutoItExit")

Local $sIPAddrees = "127.0.0.1"
Local $iPort	  = 65432






#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Networking - Servidor", 600, 500, 250, 130)
Global $txtMensajes = GUICtrlCreateEdit("", 32, 136, 537, 249)
GUICtrlSetData(-1, "txtMensajes")
$btnServidor = GUICtrlCreateButton("Iniciar servidor", 32, 8, 225, 57)
GUICtrlSetFont(-1, 9, 400, 0, "Sans Serif Collection")
$Label1 = GUICtrlCreateLabel("Mensajes del cliente", 32, 80, 298, 51)
GUICtrlSetFont(-1, 14, 800, 0, "Sans Serif Collection")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnServidor
			GUICtrlSetState($btnServidor, $GUI_DISABLE)
			MyTCP_Server($sIPAddrees, $iPort)


	EndSwitch
WEnd

EndFunc ;Termina iniciarGUI()


Func MyTCP_Server($sIPAddrees, $iPort)

	;Nos ponemos a la escucha en la ip y puerto seleccionado con un maximo establecido de 100
	;Conecciones pendientes
	Local $iListenSocket = TCPListen($sIPAddrees, $iPort, 100)
	Local $iError = 0

	If @error Then
		;Alguien ya esta escuchando esa direccion ip y puerto o el script ya esta corriendo
		$iError = @error
		MsgBox(0, "Error", "Servidor no pudo escuchar, codigo de error: " & $iError)
		Return False
	EndIf

	;Asignar una variebla para ser usada por el socket del cliente
	Local $iSocket = 0

	Do
		;Aceptamos conecciones entrantes, el socket cierra cuando termina, un socket por cliente
		$iSocket = TCPAccept($iListenSocket)

		If @error Then
			MsgBox(0, "Error", "No se puede aceptar coneciones entrantes" & $iError)
			Return false
		EndIf

	If GUIGetMsg() = $GUI_EVENT_CLOSE Then Return False

	Until $iSocket <> -1 ;Si es diferente de -1 un cliente se pudo conectar

	TCPCloseSocket($iListenSocket)

	Local $sReceived = TCPRecv($iSocket, 2048)

	Switch $sReceived

		Case "calculadora"
			_RunDos("start calc.exe")
			GUICtrlSetData($txtMensajes, "Abriendo calculadora")
		Case "blockNotas"
			_RunDos("start notepad.exe")
			GUICtrlSetData($txtMensajes, "Abriendo block de notas")
		Case "paint"
			_RunDos("start mspaint.exe")
			GUICtrlSetData($txtMensajes, "Abriendo paint")
		Case else

			GUICtrlSetData($txtMensajes, $sReceived)
	EndSwitch

	TCPCloseSocket($iSocket)

	MyTCP_Server($sIPAddrees, $iPort)

EndFunc ;Termina MyTCP_Server()


;Cerramos el servicio TCP
Func OnAutoItExit()
	TCPShutdown()
EndFunc

