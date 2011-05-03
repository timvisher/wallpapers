tell application "Finder" to Â
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of Â
		folder "Scripts" of folder "Library" of home as alias)

on getCurrentDesktops()
	tell application "System Events" to set currentDesktops to desktops
	return currentDesktops
end getCurrentDesktops

repeat with currentDesktop in getCurrentDesktops()
	advanceWallpaper(currentDesktop)
end repeat

on advanceWallpaper(currentDesktop)
	--tell application "System Events" to set currentWallpaper to (get picture of (get currentDesktop as desktop))
end advanceWallpaper

tell application "System Events"
	repeat with currentDesktop in desktops
		set currentWallpaper to picture of currentDesktop as alias
		tell application "Finder"
			set newWallpaper to some file of folder of currentWallpaper as alias
			set newWallpaperName to name of newWallpaper
		end tell
		set picture of currentDesktop to newWallpaper
		tell wallpaperHandlers to Â
			sendGrowlNotificationCustomName("Advanced Wallpaper", newWallpaperName)
	end repeat
end tell