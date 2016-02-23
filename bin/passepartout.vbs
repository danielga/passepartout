Set objShell = WScript.CreateObject("WScript.Shell")

strApp = objShell.CurrentDirectory
arrPath = Split(strApp, "\")

For i = 0 to Ubound(arrPath) - 1
	strAppPath = strAppPath & arrPath(i) & "\"
Next

strAppPath = strAppPath & "lua\"
objShell.CurrentDirectory = strAppPath

objShell.Run("luajit.exe passepartout.lua")
