/**
Maximize applications to fullscreen when detected
*/
#NoEnv
#Persistent
#SingleInstance Force
SetTimer, Max, 1000
return

Max:
	winApps := ["Netflix", "Disney+", "Amazon Prime Video"]
	webApps := ["Hulu", "HBO Max", "Vudu", "YouTube"]
	for i, app in winApps
	{
		IfWinExist %app%
		{
			WinGet, style, Style, %app%
			if (!((style & 0x20800000) ? 0 : 1))
				SendInput #+{Enter} ; SendInput Win+Shift+Enter
		}
	}
	for i, app in webApps
	{
		IfWinExist %app%
		{
			WinGet, style, Style, %app%
			if (!((style & 0x20800000) ? 0 : 1))
				Send, {F11}
		}
	}
return