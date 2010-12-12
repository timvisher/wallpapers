tell application "System Events"
	set picture of current desktop to picture of current desktop as alias
	tell current desktop
		set CurrentWallpaperAlias to picture as alias
		set currentWallpaperName to (get name of CurrentWallpaperAlias)
	end tell
end tell

tell application "Finder"
	set notifyScriptFile to POSIX file "/Users/tim/Library/Scripts/growlNotifyFunction.scpt"
end tell
set notifyScript to load script notifyScriptFile
tell notifyScript to sendGrowlNotification("Reloaded Wallpaper", currentWallpaperName)