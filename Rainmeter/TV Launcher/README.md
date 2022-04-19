# TV Launcher

A Rainmeter skin for HTPCs

![Screenshot of TV Launcher Rainmeter Skins on Desktop](/Rainmeter/TV%20Launcher/%40Resources/TV%20Launcher%20Example.png 'TV Launcher Rainmeter Skin')

Makes use of FEleven for maximizing windows (included) and Python for one time generation of copies of icons with transparent borders. FEleven requires AutoHotKey to run.
https://github.com/iglvzx/FEleven
https://www.autohotkey.com/
https://www.python.org/downloads/

## Generating Icons with Transparent Borders

By running the Python script `@Resources\GenerateTileBorders.py` all images in this skin will have copies generated with transparent borders on them. Unfortunately Rainmeter does not provide an easy way to resize an image about it's center. The workaround is to replace it with an image with a uniform transparent border. Don't forget to make sure that `ProgramName` in the ini files matches the original image file name!

## Creating Custom Icons

This repo includes examples of executables, Windows Store apps, Chrome and Edge apps, and web pages. Creating your own should be as simple as copying an existing icon folder and changing the names/command variable.

### Executables

The command variable is just the exectuable. If you wish to launch in fullscreen mode, include FEvelen in the command as follows.

```
Command="C:\Program Files\Google\Chrome\Application\chrome.exe"
Command="#@#feleven.ahk" "C:\Program Files\Google\Chrome\Application\chrome.exe"
```

### Chrome Apps

Chrome apps are located at `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Chrome Apps`. If you installed a Chrome app and it does not appear here, try uninstalling and reinstalling the Chrome app.

```
Command=#@#feleven.ahk" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Chrome Apps\Home Assistant.lnk" "Home Assistant
Command="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Chrome Apps\Home Assistant.lnk"
```

### Windows Store and Edge Apps

Launching Windows Store and Edge apps is a bit more complicated. We have to find the application target by creating a shortcut for the app as follows:

1. Type `Win + R` to open the run command dialog box
2. Type in `shell:AppsFolder` and then click OK/press Enter
3. Right click on the desired app and click `Create Shortcut`
4. Confirm that you want to create a shortcut on the desktop
5. Navigate to the Desktop folder
    - Either going to `This PC` and then Desktop or entering `Desktop` in the run command dialog box will take you there
6. Right click on the shortcut you created and click `Properties`, where the application target should be listed
   Include the target in the command as follows, using FEleven if you want to

```
Command="#@#feleven.ahk" "shell:appsFolder\Disney.37853FC22B2CE_6rarf9sa4v8jt!App" "#ProgramName#"
Command="shell:appsFolder\Disney.37853FC22B2CE_6rarf9sa4v8jt!App"
```

Alternatively you could also make it so the command directs to the shortcut you just created

To exit out of full screen in Windows Store apps, use keyboard shortcut `Win + Shift + Enter`

I also recommend setting transparency to 50% and On hover to Fade in in the Rainmeter UI to make icons pop more before selecting
