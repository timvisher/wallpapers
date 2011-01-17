tell application "Finder" to Â
	set wallpaperHandlers to (load script file "wallpaperFunctions.scpt" of Â
		folder "Scripts" of folder "Library" of home as alias)

tell wallpaperHandlers to Â
	set currentWallpaper to getCurrentWallpaper()

tell application "Pixelmator"
	open currentWallpaper
	activate
end tell

tell wallpaperHandlers to Â
	sendGrowlNotification("Opened Wallpaper For Editing")