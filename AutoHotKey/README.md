# AutoHotKey Scripts for HTPC

A collection of AutoHotKey scripts to create a better HTPC experience from your couch

## MaximizeWindowsApps

Maximize a set of selected apps to fullscreen mode. Useful for streaming or video apps. Recommended to use FEleven with shortcuts instead as this script can cause undesirable behavior when an app on it's list is not in focus. A version that also works with Windows Store apps included at `Rainmeter\TV Launcher\@Resources`)

https://github.com/iglvzx/FEleven

## PowerButtonHook

Intercept power broadcast when the power button on keyboards/cases cannot be detected by AutoHotKey. Good when you do not want to shutdown the computer but turn on/off a television or AV receiver instead (done here by sending web requests to a Broadlink smart IR remote)
In order to use this script, remap the power button by navigating to:

    - Control Panel -> Hardware and Sound -> Power Options -> Choose what the power buttons do -> When I press the power button: Turn off the display

Otherwise your computer will shut down before it runs

This is a modified version of code found in this AutoHotKey forum thread, vast majority credit goes to the original author

https://www.autohotkey.com/boards/viewtopic.php?t=17457

If you want to remap your PC keyboard/case power button to a Broadlink smart IR remote, I recommend either configuring it with Home Assistant or using this implementation of a local HTTP server for Broadlink communication found here:

https://github.com/radinsky/broadlink-http-rest

## RemapKeys

Simple example on how to intercept and remap keystrokes using AutoHotKey, in this case the volume buttons. See a full list of keys AutoHotKey can intercept here:

https://www.autohotkey.com/docs/KeyList.htm

## Drag to Scroll

Great for air mouses, scroll on screen by clicking and dragging. Did not write this at all and can be found here:

https://github.com/Mikhail22/drag-scroll--autohotkey
