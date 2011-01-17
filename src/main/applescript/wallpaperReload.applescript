tell application "Finder" to Â
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of Â
		folder "Scripts" of folder "Library" of home as alias)

tell wallpaperHandlers to Â
	setWallpaper(getCurrentWallpaper())

tell wallpaperHandlers to Â
	sendGrowlNotification("Reloaded Wallpaper")