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

Media_Play_Pause::
	Send, {Space}
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