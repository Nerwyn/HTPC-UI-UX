/**
Basic example of remapping keyboard keys to custom commands
Useful for redirecting volume controls to a Broadlink smart IR remote for Home Theater systems
*/
#NoEnv
#Persistent
#SingleInstance Force
SendMode Input
; #InstallKeybdHook

Volume_Up::
	HttpPost("services/script/amplifier_volume_up")
return

Volume_Down::
	HttpPost("services/script/amplifier_volume_down")
return

; Replace directional key keyholds with scrolling for better streaming app navigation
; Adapted from this post https://www.autohotkey.com/board/topic/123082-do-something-while-key-is-held-down/
Up::
	now := A_TickCount
	scroll := false
	while GetKeyState("Up", "P")
		if (A_TickCount-now > 200) {
			scroll := true
			Send {WheelUp 1}
			Sleep 20
		}
	if not scroll {
		Send {Up}
	}
return

Down::
	now := A_TickCount
	scroll := false
	while GetKeyState("Down", "P")
		if (A_TickCount-now > 200) {
			scroll := true
			Send {WheelDown 1}
			Sleep 20
		}
	if not scroll {
		Send {Down}
	}
return

Left::
	now := A_TickCount
	scroll := false
	while GetKeyState("Left", "P")
		if (A_TickCount-now > 200) {
			scroll := true
			Send {WheelLeft 1}
			Sleep 250
		}
	if not scroll {
		Send {Left}
	}
return

Right::
	now := A_TickCount
	scroll := false
	while GetKeyState("Right", "P")
		if (A_TickCount-now > 200) {
			scroll := true
			Send {WheelRight 1}
			Sleep 250
		}
	if not scroll {
		Send {Right}
	}
return

LAlt & F4::
	; Using a new HTPC launcher app. Ensure that it can't be closed by remote close button.
	IfWinActive, launcher
		return
	; YouTube TV in browser does not respect Alt F4 in full screen, have to exit full screen first.
	IfWinActive, YouTube on TV
		Send {F11}
		Sleep 100
	Send !{F4}
	Sleep 100
	; Switch back to HTPC launcher app after closing a different app.
	WinActivate, launcher
return

HttpPost(endpoint) {
	token := "thisisafaketokenputyourshere"
	root := "https://yourserveraddress.com"
	url := root endpoint
	static req:= ComObjCreate("WinHttp.Winhttprequest.5.1")
	req.open("POST", url, true)
	req.SetRequestHeader("Authorization", "Bearer "token)
	req.send()
	return
}
