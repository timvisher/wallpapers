set preferencesFolderPath to path to preferences folder from user domain as string
set desktopSettingsPlist to preferencesFolderPath & "com.apple.desktop.plist"
set wallpaperPaths to []
tell application "System Events"
	set desktopIds to id of desktops
	repeat with desktopId in desktopIds
		tell property list file desktopSettingsPlist
			tell contents
				set desktopSettings to property list item (desktopId as string) of property list item "" of property list item "spaces" of property list item "Background"
				tell desktopSettings
					set wallpaperPaths to wallpaperPaths & ((value of property list item "ChangePath") & "/" & (value of property list item "LastName"))
				end tell
			end tell
		end tell
	end repeat
end tell
repeat with wallpaperPath in wallpaperPaths
	tell application "Finder"
		-- yes it appears that the following idiocy is necessary… /me sighs
		set thePath to wallpaperPath as string
		set theWallpaperPosixFile to POSIX file thePath as string
		set theWindow to make new Finder window
		set target of theWindow to theWallpaperPosixFile
	end tell
end repeat