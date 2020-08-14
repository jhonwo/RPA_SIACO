Option Explicit

Dim WORKFLOW_PATH
WORKFLOW_PATH = "C:\Users\Administrator\Documents\UiPath\FinalizacionLocalizacionMercancias\Main.xaml"

Dim uiPathFolder
Dim user
Dim objFSO
Dim folder
Dim objRE
Dim uiRobotPath
Dim oShell
Dim objShell
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objRE = New RegExp
Set objShell = WScript.CreateObject ("WScript.shell")

With objRE
	.Pattern    = "\d+\.\d+\.\d+"
	.IgnoreCase = True
	.Global     = False
End With

uiPathFolder = "C:\Users\" + CreateObject("WScript.Network").UserName + "\AppData\Local\UiPath"

For Each folder In objFSO.GetFolder(uiPathFolder).SubFolders
    If objRE.Test(folder) Then
    	uiRobotPath = folder.Path + "\UiRobot.exe"
    End If
Next

objShell.Run ""+ uiRobotPath +" -file " + WORKFLOW_PATH + "" 

'WScript.Echo "ROBOT IS LOADING!"