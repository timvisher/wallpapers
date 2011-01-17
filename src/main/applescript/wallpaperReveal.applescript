tell application "Finder" to �
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of �
		folder "Scripts" of folder "Library" of home as alias)

tell application "Finder"
	tell wallpaperHandlers to �
		set currentWallpaper to getCurrentWallpaper()
	reveal currentWallpaper
	activate
end tell

tell wallpaperHandlers to �
	sendGrowlNotification("Revealed Wallpaper")
