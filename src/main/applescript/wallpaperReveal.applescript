tell application "Finder" to Â
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of Â
		folder "Scripts" of folder "Library" of home as alias)

tell application "Finder"
	tell wallpaperHandlers to Â
		set currentWallpaper to getCurrentWallpaper()
	reveal currentWallpaper
	activate
end tell

tell wallpaperHandlers to Â
	sendGrowlNotification("Revealed Wallpaper")
