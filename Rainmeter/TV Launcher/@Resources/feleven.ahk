/**
FEleven is licensed under GNU GPL v3, this is a slightly modified version of it that also supports Windows Apps
https://github.com/iglvzx/FEleven
*/
#SingleInstance Force
#NoTrayIcon
#NoEnv
SetTitleMatchMode, 1
StringCaseSense, Off

target = %1%
window = %2%

if (window = "")
{ ; built-in support
	IfInString, target, % "firefox.exe"
	{
		window := "ahk_class MozillaWindowClass"
	}
	IfInString, target, % "chrome.exe"
	{
		window := "ahk_class Chrome_WidgetWin_1"
	}
	IfInString, target, % "opera.exe"
	{
		window := "ahk_class OperaWindowClass"
	}
	IfInString, target, % "iexplore.exe"
	{
		window := "ahk_class IEFrame"
	}
}

Run, %target%

WinWaitActive, %window%

WinGetPos, X, Y, Width, Height, A
if !(Width = A_ScreenWidth && Height = A_ScreenHeight)
{
	SendInput, {F11}
	SendInput #+{Enter} ; SendInput Win+Shift+Enter
}

ExitApp