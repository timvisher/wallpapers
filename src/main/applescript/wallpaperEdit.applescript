tell application "System Events"
	tell current desktop
		set currentWallpaper to picture as alias
		set currentWallpaperName to (get name of currentWallpaper)
		tell application "Adobe Photoshop CS4"
			open currentWallpaper
			activate
		end tell
	end tell
end tell

tell application "Finder"
	set notifyScriptFile to POSIX file "/Users/tim/Documents/Software/Wallpaper Manager/src/main/applescript/growlNotifyFunction.scpt"
end tell
set notifyScript to load script notifyScriptFile
tell notifyScript to sendGrowlNotification("Opened Wallpaper For Editing", currentWallpaperName)