on getWallpaperLibrary()
	tell application "Finder" to return folder "Wallpaper" of folder "Pictures" of home as alias
end getWallpaperLibrary

on getParkedDirectory()
	tell application "Finder" to set parked to get folder "Parked" of library as alias
	return parked
end getParkedDirectory

on getCurrentWallpaper()
	tell application "System Events" to Â
		set currentWallpaper to picture of current desktop as alias
	return currentWallpaper
end getCurrentWallpaper

on getCurrentWallpaperName()
	set currentWallpaper to getCurrentWallpaper()
	tell application "Finder" to Â
		set currentWallpaperName to name of currentWallpaper
	return currentWallpaperName
end getCurrentWallpaperName

on getResolutionDirectory()
	set library to getWallpaperLibrary()
	set currentResolution to getScreenResolution()
	set directoryName to item 1 of currentResolution & "x" & item 2 of currentResolution as string
	tell application "Finder" to return folder directoryName of library as alias
end getResolutionDirectory

on getPatternDirectory()
	set library to getWallpaperLibrary()
	tell application "Finder" to return folder "Patterns" of library as alias
end getPatternDirectory

on getRandomWallpaper()
	set currentWallpaper to getCurrentWallpaper()
	set resolutionDirectory to getResolutionDirectory()
	set patternDirectory to getPatternDirectory()
	set patternInstead to 3 is equal to (random number 3)
	tell application "Finder" to Â
		if patternInstead then
			set randomWallpaper to some file of patternDirectory as alias
		else
			set randomWallpaper to some file of resolutionDirectory as alias
		end if
	return randomWallpaper
end getRandomWallpaper

on getScreenResolution()
	tell application "ASSAccess"
		tell application "Automator Runner"
			set screensArray to call method "screens" of class "NSScreen"
			set dims to call method "frame" of (item 1 of screensArray)
			return {(item 3 of dims as integer), (item 4 of dims as integer)}
		end tell
	end tell
end getScreenResolution

on setWallpaper(wallpaperAlias)
	tell application "System Events" to set picture of current desktop to wallpaperAlias
end setWallpaper

on sendGrowlNotification(titleAndDescription)
	sendGrowlNotificationCustomName(titleAndDescription, getCurrentWallpaperName())
end sendGrowlNotification

on sendGrowlNotificationCustomName(titleAndDescription, imageName)
	tell application "GrowlHelperApp"
		-- Make a list of all the notification types 
		-- that this script will ever send:
		set the allNotificationsList to Â
			{"Advanced Wallpaper", "Trashed Wallpaper", "Opened Wallpaper For Editing", "Revealed Wallpaper", "Reloaded Wallpaper", "Parked Wallpaper"}
		
		-- Make a list of the notifications 
		-- that will be enabled by default.      
		-- Those not enabled by default can be enabled later 
		-- in the 'Applications' tab of the growl prefpane.
		set the enabledNotificationsList to allNotificationsList
		
		-- Register our script with growl.
		-- You can optionally (as here) set a default icon 
		-- for this script's notifications.
		register as application Â
			"Super Wallpaper Manager!" all notifications allNotificationsList Â
			default notifications enabledNotificationsList
		
		--	Send a Notification...
		notify with name Â
			titleAndDescription title Â
			titleAndDescription description Â
			imageName application name Â
			"Super Wallpaper Manager!" image from location "file:///Users/tim/Documents/Software/Wallpaper Manager/src/main/assets/wallpaperAdvanceIcon.png"
	end tell
end sendGrowlNotificationCustomName