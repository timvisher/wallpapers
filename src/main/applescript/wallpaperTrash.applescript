tell application "System Events"
	tell current desktop
		set wallpaperFolder to pictures folder as alias
	end tell
end tell
--log wallpaperFolder

tell application "Finder"
	set randomImage to some file of wallpaperFolder as alias
end tell
--log randomImage

tell application "System Events"
	tell current desktop
		set currentDesktop to (get picture as alias)
		set currentDesktopName to (get name of currentDesktop)
		tell application "Finder"
			delete currentDesktop
		end tell
		set picture to randomImage
	end tell
end tell

tell application "Finder"
	set notifyScriptFile to POSIX file "/Users/tim/Library/Scripts/growlNotifyFunction.scpt"
end tell
set notifyScript to load script notifyScriptFile
tell notifyScript to sendGrowlNotification("Trashed Wallpaper", currentDesktopName)