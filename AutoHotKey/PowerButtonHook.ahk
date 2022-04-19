/**
Intercept power broadcast when the power button on keyboards/cases cannot be detected by AutoHotKey
Good when you do not want to shutdown the computer but turn on/off a television or AV receiver instead (done here by sending web requests to a Broadlink smart IR remote)
In order to use this script, remap the power button by navigating to:
	Control Panel -> Hardware and Sound -> Power Options -> Choose what the power buttons do -> When I press the power button: Turn off the display
Otherwise your computer will shut down before it runs

This is a modified version of code found in this AutoHotKey forum thread, vast majority credit goes to the original author
https://www.autohotkey.com/boards/viewtopic.php?t=17457
*/
#Persistent
#SingleInstance force

GUID_MONITOR_POWER_ON:="02731015-4510-4526-99e6-e5a17ebd1aea"
GUID_CONSOLE_DISPLAY_STATE:="6fe69556-704a-47a0-8f24-c28d936fda47"
global newGUID:=""

VarSetCapacity(newGUID,16,0)
if a_OSVersion in WIN_8,WIN_8.1,WIN_10
	dllCall("Rpcrt4\UuidFromString","Str",GUID_CONSOLE_DISPLAY_STATE,"UInt",&newGUID)
else
	dllCall("Rpcrt4\UuidFromString","Str",GUID_MONITOR_POWER_ON,"UInt",&newGUID)
rhandle:=dllCall("RegisterPowerSettingNotification","UInt",a_scriptHwnd,"Str",strGet(&newGUID),"Int",0)

onMessage(0x218,"WM_POWERBROADCAST")

WM_POWERBROADCAST(wParam,lParam) {
	static PBT_POWERSETTINGCHANGE:=0x8013
	if(wParam=PBT_POWERSETTINGCHANGE){
		if(subStr(strGet(lParam),1,strLen(strGet(lParam))-1)=strGet(&newGUID)){
			Send #^+B ; Rewake screen by resetting video driver to prevent display from actually turning off
			HttpPost("services/script/tv_amplifier_power") ; Change to whatever you want
			sleep 10000 ; To prevent AV receiver and TV from being switched on and off too much and becoming out of sync, remove if not needed
		}
	}
	return
}

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