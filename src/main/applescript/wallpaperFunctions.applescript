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

on getRandomWallpaper()
	set currentWallpaper to getCurrentWallpaper()
	tell application "Finder" to Â
		set randomWallpaper to some file of folder of currentWallpaper as alias
	return randomWallpaper
end getRandomWallpaper

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
			{"Advanced Wallpaper", "Trashed Wallpaper", "Opened Wallpaper For Editing", "Revealed Wallpaper", "Reloaded Wallpaper"}
		
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