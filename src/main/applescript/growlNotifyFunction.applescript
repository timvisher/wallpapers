on sendGrowlNotification(titleAndDescription, imageName)
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
end sendGrowlNotification