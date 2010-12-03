tell application "System Events"
	tell current desktop
		set wallpaperFolder to pictures folder as alias
	end tell
end tell
--log wallpaperFolder

tell application "Finder"
	set randomImage to some file of wallpaperFolder as alias
	set randomImageName to (get name of randomImage)
end tell
--log randomImage
--log randomImageName

tell application "System Events"
	set picture of current desktop to randomImage
end tell

tell application "Finder"
	set notifyScriptFile to POSIX file "/Users/tim/Documents/Software/Wallpaper Manager/src/main/applescript/growlNotifyFunction.scpt"
end tell
set notifyScript to load script notifyScriptFile
tell notifyScript to sendGrowlNotification("Advanced Wallpaper", randomImageName)
