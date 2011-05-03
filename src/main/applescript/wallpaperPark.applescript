tell application "Finder" to Â
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of Â
		folder "Scripts" of folder "Library" of home as alias)

tell wallpaperHandlers
	set priorWallpaper to getCurrentWallpaper()
	set priorWallpaperName to getCurrentWallpaperName()
	set parked to getParkedDirectory()
	setWallpaper(getRandomWallpaper())
end tell

tell application "Finder"
	move priorWallpaper to parked
end tell

tell wallpaperHandlers
	sendGrowlNotificationCustomName("Parked Wallpaper", priorWallpaperName)
	sendGrowlNotification("Advanced Wallpaper")
end tell